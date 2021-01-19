unit fala;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation,
  //
  Androidapi.JNI.Speech,
  AndroidTTS
  ;

type
  TfrmFala = class(TForm)
    Label1: TLabel;
    btnFrase1: TButton;
    btnFrase2: TButton;
    btnFrase3: TButton;
    btnFraseDigitada: TButton;
    Label2: TLabel;
    edtFrase: TEdit;
    procedure btnFrase1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFrase2Click(Sender: TObject);
    procedure btnFrase3Click(Sender: TObject);
    procedure btnFraseDigitadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFala: TfrmFala;
  tts : TAndroidTTS;

implementation

{$R *.fmx}

procedure TfrmFala.btnFrase1Click(Sender: TObject);
begin
   tts.Speak('Sejam todos bem-vindos à aprensentação do G-Bot');
end;

procedure TfrmFala.btnFrase2Click(Sender: TObject);
begin
  tts.Speak('Possui reconhecimento facial');
end;

procedure TfrmFala.btnFrase3Click(Sender: TObject);
begin
  tts.Speak('Microfone e leitor NFC');
end;

procedure TfrmFala.btnFraseDigitadaClick(Sender: TObject);
begin
   tts.Speak(edtFrase.Text);
end;

procedure TfrmFala.FormActivate(Sender: TObject);
begin
   tts := TAndroidTTS.Create;
end;

end.
