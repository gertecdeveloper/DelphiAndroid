unit nfc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,
  System.Diagnostics,
  System.TimeSpan,
  //
  NFCHelper, FMX.Objects, FMX.Layouts, FMX.ScrollBox, FMX.Memo;

type
  TfrmNFC = class(TForm)
    Label1: TLabel;
    edtMensagem: TEdit;
    btnGravar: TButton;
    btnLer: TButton;
    btnFormatar: TButton;
    btnLeituraGravacao: TButton;
    painel: TLayout;
    Image1: TImage;
    lbPainelTitle: TLabel;
    lbResposta: TLabel;
    meResposta: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLerClick(Sender: TObject);
    procedure btnFormatarClick(Sender: TObject);
    procedure btnLeituraGravacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarPainel(titulo: string);
    procedure MostrarTempoExecucao();
  public
    { Public declarations }
  end;

var
  frmNFC: TfrmNFC;
  NFCAdapter : TNFCHelper;
  Stopwatch: TStopwatch;
  Elapsed: TTimeSpan;
  Seconds: Double;
  Resultado: string;

implementation

{$R *.fmx}



procedure TfrmNFC.btnFormatarClick(Sender: TObject);
begin
    MostrarPainel('Formatar Cartão');

    NFCAdapter.FormatarNFC(
        procedure(status: NFC_RESPONSE; return : string)
          begin
             ShowMessage(return);
             MostrarTempoExecucao;
          end
    );
end;

procedure TfrmNFC.btnGravarClick(Sender: TObject);
var
msg : string;
begin
     edtMensagem.SetFocus;
     if edtMensagem.Text = '' then msg := 'Gertec' else msg := edtMensagem.Text;
     MostrarPainel('Gravar Cartão');
     NFCAdapter.GravarMesagem(msg,
        procedure(status: NFC_RESPONSE; return : string)
          begin
             ShowMessage(return);
             MostrarTempoExecucao;
          end
    );
end;

procedure TfrmNFC.btnLeituraGravacaoClick(Sender: TObject);
begin
    MostrarPainel('Gravar/Ler Cartão');
    NFCAdapter.TesteLeituraGravacao(
          procedure(status: NFC_RESPONSE; return : string; MensagemCartao: string)
          begin
             ShowMessage(return);
             meResposta.Text := MensagemCartao;
          end);
end;

procedure TfrmNFC.btnLerClick(Sender: TObject);
begin
   MostrarPainel('Leitura do Cartão NFC');
   NFCAdapter.LerCartao(
        procedure(status: NFC_RESPONSE; return : string; MensagemCartao: string)
          begin
             ShowMessage(return);
             lbResposta.Text := MensagemCartao;
             MostrarTempoExecucao;
          end
    );
end;

procedure TfrmNFC.FormCreate(Sender: TObject);
begin
   NFCAdapter :=  TNFCHelper.Create;
end;

procedure TfrmNFC.MostrarPainel(titulo: string);
begin
     painel.Visible := True;
     lbPainelTitle.Text := titulo;
     lbResposta.Text := 'Aproxime o Cartão';
     Stopwatch := TStopwatch.StartNew;
end;

procedure TfrmNFC.MostrarTempoExecucao;
begin
     Elapsed := Stopwatch.Elapsed;
     meResposta.Text := 'Tempo de execução: ' + floattostr(Elapsed.TotalSeconds) + ' segundos';
end;

end.
