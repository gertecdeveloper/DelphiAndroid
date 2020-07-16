unit uNFC;

interface

uses
  NFCHelper,
  FMX.Dialogs,
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


  NFC_MODOS = (NFC_NONE, NFC_LEITURA_ID, NFC_LEITURA_MSG, NFC_ESCRITA);

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
    timerNFC: TTimer;
    procedure btnIdCarClick(Sender: TObject);
    procedure btnMensagensClick(Sender: TObject);
    procedure btnGravarMensagemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure timerNFCTimer(Sender: TObject);
    procedure MensagemEscolhaOpcao;
    procedure MensagemAproximeCartao;
    procedure ExecuteNFC(NewNFCMode:NFC_MODOS);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNFC: TfrmNFC;
  NFC : TNFCHelper;
  ModoNFC:NFC_MODOS;


implementation

{$R *.fmx}

//****************************************************
procedure TfrmNFC.ExecuteNFC(NewNFCMode:NFC_MODOS);

begin

  nfc.ClearData;
  MensagemAproximeCartao;
  ModoNFC := NewNFCMode;

  case ModoNFC of
    NFC_ESCRITA:        NFC.setGravaMensagemURL(txtMensagem.Text, txtUrl.Text);
    NFC_LEITURA_ID:     NFC.setLeituraID;
    NFC_LEITURA_MSG:   NFC.setLeituraMensagem;
  end;

  timerNFC.Enabled := true;


end;
//****************************************************
procedure TfrmNFC.btnGravarMensagemClick(Sender: TObject);
begin
  ExecuteNFC(NFC_ESCRITA);
end;
//****************************************************
procedure TfrmNFC.btnIdCarClick(Sender: TObject);
begin
  ExecuteNFC(NFC_LEITURA_ID);
end;
//****************************************************
procedure TfrmNFC.btnMensagensClick(Sender: TObject);
begin
  ExecuteNFC(NFC_LEITURA_MSG);
end;
//****************************************************
procedure TfrmNFC.MensagemEscolhaOpcao;
begin

  ModoNFC := NFC_NONE;
  lblMensagem.Text := 'Escolha uma opção.';
end;
//****************************************************
procedure TfrmNFC.MensagemAproximeCartao;
begin
  lblMensagem.Text := 'Aproxime o cartão.';
end;
//****************************************************

procedure TfrmNFC.FormCreate(Sender: TObject);
begin
//NFC := TNFCHelper.Create( lblMensagem, txtMensagem, txtUrl);
NFC := TNFCHelper.Create;
MensagemEscolhaOpcao;

end;

procedure TfrmNFC.timerNFCTimer(Sender: TObject);
begin
timerNFC.Enabled := false;

case ModoNFC of

  NFC_LEITURA_ID:begin
    if(NFC.CardId = '')then begin
      timerNFC.Enabled := true;
    end else begin
      MensagemEscolhaOpcao;
      ShowMessage('ID do cartão   : ' + NFC.CardId+#13#10'ID do cartão(Hex): ' + NFC.CardIdHex+#13#10);
    end;

  end;

  NFC_LEITURA_MSG:begin
    if((NFC.NFCMensagem = '')and(NFC.NFCUrl = ''))then begin
      timerNFC.Enabled := true;
    end else begin

      MensagemEscolhaOpcao;
      if(NFC.NFCMensagem <> '')then  begin
        txtMensagem.Lines.Clear;
        txtMensagem.Lines.Add(NFC.NFCMensagem);
      end;

      if(NFC.NFCUrl<>'')then
        txtUrl.Text := NFC.NFCUrl;
      ShowMessage('Mensagem' + #13#10 + NFC.NFCMensagem +#13#10#13#10 + 'Url:'#13#10+NFC.NFCUrl );
    end;




  end;//NFC_LEITURA_MSGX

  NFC_ESCRITA:begin

    case nfc.NFCWriteStatus of
      NFC_WRITE_OK,
      NFC_WRITE_FAIL:MensagemEscolhaOpcao;
    end;

    case nfc.NFCWriteStatus of
      NFC_WRITE_OK:ShowMessage('Dados gravados com sucesso.');
      NFC_WRITE_FAIL:ShowMessage('Erro ao gravar mensagem no cartão.');
      else timerNFC.Enabled := true;
    end;

  end;


end; //case


end;


end.
