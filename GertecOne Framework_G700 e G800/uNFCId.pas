unit uNFCId;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  // JavaInterfaces,
  Androidapi.Helpers,
  G700NFC
  ;

type
  TfrmNFCid = class(TForm)
    lblMensagem: TLabel;
    btnIdCartao: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIdCartaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNFCid: TfrmNFCid;

implementation

{$R *.fmx}

var
  G700NFC : TG700NFC;


procedure TfrmNFCid.btnIdCartaoClick(Sender: TObject);
begin
  G700NFC.MensagemAproximeCartao;
  G700NFC.setLeituraID;
end;


procedure TfrmNFCid.FormActivate(Sender: TObject);
begin
G700NFC := TG700NFC.Create(lblMensagem);
end;


procedure TfrmNFCid.FormCreate(Sender: TObject);
begin
//G700NFC := TG700NFC.Create(lblMensagem);
end;

end.
