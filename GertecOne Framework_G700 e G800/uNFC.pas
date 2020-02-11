unit uNFC;

interface

uses
  NFCHelper,
  FMX.Forms,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.ExtCtrls,
  FMX.Layouts,
  System.Classes,
  FMX.Types,
  FMX.Controls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  TfrmNFC = class(TForm)
    lblMensagem: TLabel;
    btnIdCar: TButton;
    btnMensagens: TButton;
    ImageViewer1: TImageViewer;
    btnGravarMensagem: TButton;
    txtMensagem: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    txtUrl: TEdit;
    procedure btnIdCarClick(Sender: TObject);
    procedure btnMensagensClick(Sender: TObject);
    procedure btnGravarMensagemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNFC: TfrmNFC;
  NFC : TNFCHelper;


implementation

{$R *.fmx}


procedure TfrmNFC.btnGravarMensagemClick(Sender: TObject);
begin
  NFC.setGravaMensagem;
  NFC.setMensagemURL(txtMensagem.Text, txtUrl.Text);
end;



procedure TfrmNFC.btnIdCarClick(Sender: TObject);
begin
  NFC.setLeituraID;
end;

procedure TfrmNFC.btnMensagensClick(Sender: TObject);
begin
  NFC.setLeituraMensagem;
end;


procedure TfrmNFC.FormCreate(Sender: TObject);
begin
NFC := TNFCHelper.Create( lblMensagem, txtMensagem, txtUrl);
end;

end.
