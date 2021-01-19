unit CodigoDeBarras;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  wangpos.sdk4.libbasebinder,  // lib usada no scaner
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  System.Threading,
  System.IOUtils,
  LedUtil,
  Androidapi.Helpers, FMX.Media;

type
  TfrmCodigoDeBarras = class(TForm)
    Label1: TLabel;
    btnIniciarServico: TButton;
    btnPararServico: TButton;
    btnLigarLed: TButton;
    btnDesligarLed: TButton;
    meResposta: TMemo;
    MediaPlayer1: TMediaPlayer;
    lbStatus: TLabel;
    procedure btnIniciarServicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPararServicoClick(Sender: TObject);
    procedure beepSound(ResourceID: string);
    procedure btnLigarLedClick(Sender: TObject);
    procedure btnDesligarLedClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCodigoDeBarras: TfrmCodigoDeBarras;
  scaner : JScaner;
  run_scanner : Boolean;

implementation

{$R *.fmx}
procedure TfrmCodigoDeBarras.beepSound(ResourceID: string);
var
  ResStream: TResourceStream;
  TmpFile: string;
begin
      ResStream := TResourceStream.Create(HInstance, ResourceID, RT_RCDATA);
      try

        TmpFile := TPath.Combine(TPath.GetDocumentsPath, 'Bleep.mp3');

        ResStream.Position := 0;
        ResStream.SaveToFile(TmpFile);

        MediaPlayer1.FileName := TmpFile;
        MediaPlayer1.Play;

      finally
        ResStream.Free;
      end;

      MediaPlayer1.Play;
end;

procedure TfrmCodigoDeBarras.btnIniciarServicoClick(Sender: TObject);
var
 Bytes: TJavaArray<Byte>;
 result: string;
 len : TJavaArray<Integer>;
 status: integer;
begin
  Bytes := TJavaArray<Byte>.Create(2048);
  len := TJavaArray<Integer>.Create(1);
  run_scanner := True;

  // O Scanner precisa ser iniciado e rodar em uma thread separada
  TThread.CreateAnonymousThread(procedure ()
    begin
       scaner := TJScaner.JavaClass.init(TAndroidHelper.Context);

       if run_scanner then lbStatus.Text := 'On' else lbStatus.Text := 'Off';

       while run_scanner do

       begin
         status := scaner.scanSingle(Bytes, len);
         if status = 0 then
         begin
            // necessario a sincronizacao com a thread principal para atualizar a interface
            TThread.Synchronize(nil,
            procedure
            begin
               if (status = 0) and (run_scanner) then
               begin
                 beepSound('Resource_1');
                 //converte os bytes recebidos do scaner para um string java e entao para string delphi
                 result := JStringToString(TJString.JavaClass.init(Bytes));
                 // descartamos os 3 primeiros resultados do retorno do scaner, geralmente é "nova linha" e "retorno de carro"
                 meResposta.Lines.Insert(0,Copy(Result, 3, Result.Length - 3));

               end;
            end);
            // pausamos a thread para poupar processamento por 1 sec
            TThread.Sleep(1000);
         end;
       end;

       FreeAndNil(scaner);

    end).Start;
end;

procedure TfrmCodigoDeBarras.btnLigarLedClick(Sender: TObject);
begin
  setLed(LedUtil.LED_RED);
end;


procedure TfrmCodigoDeBarras.btnDesligarLedClick(Sender: TObject);
begin
  setLed(LedUtil.LED_OFF);
end;

procedure TfrmCodigoDeBarras.btnPararServicoClick(Sender: TObject);
begin
   run_scanner := False;
   lbStatus.Text := 'Off';
end;

procedure TfrmCodigoDeBarras.FormCreate(Sender: TObject);
begin
    run_scanner := False;
end;

procedure TfrmCodigoDeBarras.FormDeactivate(Sender: TObject);
begin
   run_scanner := False;
   setLed(LedUtil.LED_OFF);
   lbStatus.Text := 'Off';
end;

end.
