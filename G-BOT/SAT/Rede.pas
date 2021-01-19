unit Rede;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox,XMLDoc, XMLIntf,
  //SAT
  SatFunctions,Utils,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FrameResposta;

type
  TfrmRede = class(TForm)
    Label1: TLabel;
    edtCodAtiv: TEdit;
    Label2: TLabel;
    cbTipoRede: TComboBox;
    itemEstatico: TListBoxItem;
    itemDHCP: TListBoxItem;
    Label3: TLabel;
    edIPSat: TEdit;
    Label4: TLabel;
    edMascara: TEdit;
    Label5: TLabel;
    edGateway: TEdit;
    Label6: TLabel;
    cbDNS: TComboBox;
    itemSim: TListBoxItem;
    itemNao: TListBoxItem;
    Label7: TLabel;
    edDNS1: TEdit;
    Label8: TLabel;
    edDNS2: TEdit;
    Label9: TLabel;
    cbProxy: TComboBox;
    itemNaoUsaProxy: TListBoxItem;
    itemProxyConfig: TListBoxItem;
    itemProxyTrans: TListBoxItem;
    Label10: TLabel;
    edProxyIP: TEdit;
    Label11: TLabel;
    edPorta: TEdit;
    Label12: TLabel;
    edUser: TEdit;
    Label13: TLabel;
    edPassword: TEdit;
    btnEnviar: TButton;
    procedure cbTipoRedeChange(Sender: TObject);
    procedure cbDNSChange(Sender: TObject);
    procedure cbProxyChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodAtivTyping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfigurarRede(codigoAtivacao: string; dadosConfiguracao: string);
  end;

var
  frmRede: TfrmRede;
  satLib : TSatFunctions;
  retorno : TRetornoSAt;
  RetornoSAT,
  codigoAtivacao,
  dadosConfiguracao: string;

implementation

{$R *.fmx}

//FUNÇÃO QUE ENVIAR DADOS AO SAT
procedure TfrmRede.ConfigurarRede(codigoAtivacao: string; dadosConfiguracao: string);
begin
  if (ValidaCodigoAtivacao(codigoAtivacao)) then begin
      RetornoSAT := satLib.ConfigurarInterfaceDeRede(
          Utils.GerarNumeroSessao,
          codigoAtivacao,
          dadosConfiguracao
        );

      retorno := InvocarOperacaoSat(TIPO_ATIVAR_SAT, RetornoSAT);
      ShowMessage(FormataRetornoSat(retorno));
  end else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

procedure TfrmRede.edtCodAtivTyping(Sender: TObject);
begin
    Utils.CodigoAtivacao := edtCodAtiv.Text;
end;

procedure TfrmRede.btnEnviarClick(Sender: TObject);
var
  ConfigXML: TXMLDocument;
  NodeConfig: IXMLNode;
  retorno : TRetornoSAt;
begin
  codigoAtivacao := edtCodAtiv.Text;

  ConfigXML := TXMLDocument.Create(Self);
  try
     ConfigXML.Active := True;
     NodeConfig := ConfigXML.AddChild('config');

     if (cbTipoRede.ItemIndex = 0) then
     begin
         NodeConfig.ChildValues['tipoLan'] := 'IPFIX';

         if not (edIPSat.Text = '') then
            NodeConfig.ChildValues['lanIP'] := edIPSat.Text;

         if not (edMascara.Text = '') then
            NodeConfig.ChildValues['lanMask'] := edMascara.Text;

         if not (edGateway.Text = '') then
            NodeConfig.ChildValues['lanGW'] := edGateway.Text;

          if (cbDNS.ItemIndex = 0) then
          begin
           if not (edDNS1.Text = '') then
            NodeConfig.ChildValues['lanDNS1'] := edDNS1.Text;

            if not (edDNS2.Text = '') then
            NodeConfig.ChildValues['lanDNS2'] := edDNS2.Text;
          end
          else
          begin
            NodeConfig.ChildValues['lanDNS1'] := '8.8.8.8';
            NodeConfig.ChildValues['lanDNS2'] := '4.4.4.4';
          end;
     end
     else
         NodeConfig.ChildValues['tipoLan'] := 'DHCP';

     if (cbProxy.ItemIndex = 0) then
         NodeConfig.ChildValues['proxy'] := 0
     else
     begin
         if (cbProxy.ItemIndex = 1) then
             NodeConfig.ChildValues['proxy'] := 1
         else
             NodeConfig.ChildValues['proxy'] := 2;

         if not (edProxyIP.Text = '') then
            NodeConfig.ChildValues['proxy_ip'] := edProxyIP.Text;

         if not (edPorta.Text = '') then
            NodeConfig.ChildValues['proxy_porta'] := edPorta.Text;

         if not (edUser.Text = '') then
            NodeConfig.ChildValues['proxy_user'] := edUser.Text;

         if not (edPassword.Text = '') then
            NodeConfig.ChildValues['proxy_senha'] := edPassword.Text;

     end;

//     ShowMessage( ConfigXML.XML.Text);

     dadosConfiguracao := ConfigXML.XML.Text;
     ConfigurarRede(codigoAtivacao, dadosConfiguracao);

  finally
     ConfigXML.Free;
  end;

end;

procedure TfrmRede.cbDNSChange(Sender: TObject);
begin

      if (cbDNS.ItemIndex = 0) then
      begin
         edDNS1.Enabled := True;
         edDNS2.Enabled := True;

      end
      else
      begin
         edDNS1.Enabled := False;
         edDNS2.Enabled := False;

         edDNS1.Text := '';
         edDNS2.Text := '';

      end;
end;

procedure TfrmRede.cbProxyChange(Sender: TObject);
begin
       if (cbProxy.ItemIndex = 0) then
      begin
         edProxyIP.Enabled := False;
         edPorta.Enabled := False;
         edUser.Enabled := False;
         edPassword.Enabled := False;

         edProxyIP.Text := '';
         edPorta.Text := '';
         edUser.Text := '';
         edPassword.Text := '';

      end
      else
      begin
         edProxyIP.Enabled := True;
         edPorta.Enabled := True;
         edUser.Enabled := True;
         edPassword.Enabled := True;



      end;
end;

procedure TfrmRede.cbTipoRedeChange(Sender: TObject);
begin
      if (cbTipoRede.ItemIndex = 0) then
      begin
         edIPSat.Enabled := True;
         edMascara.Enabled := True;
         edGateway.Enabled := True;

      end
      else
      begin
         edIPSat.Enabled := False;
         edMascara.Enabled := False;
         edGateway.Enabled := False;

         edIPSat.Text := '';
         edMascara.Text := '';
         edGateway.Text := '';

      end;
end;

procedure TfrmRede.FormCreate(Sender: TObject);
begin
         cbTipoRede.ItemIndex := 1;
         edIPSat.Enabled := False;
         edMascara.Enabled := False;
         edGateway.Enabled := False;

         cbDNS.ItemIndex := 1;
         edDNS1.Enabled := False;
         edDNS2.Enabled := False;


         edProxyIP.Enabled := False;
         edPorta.Enabled := False;
         edUser.Enabled := False;
         edPassword.Enabled := False;
end;



procedure TfrmRede.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   edtCodAtiv.Text := Utils.CodigoAtivacao;

end;

end.
