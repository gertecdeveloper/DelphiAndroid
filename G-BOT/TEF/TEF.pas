unit TEF;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Types, FMX.Edit, FMX.EditBox,
  FMX.NumberBox,

  FMX.DialogService,

  System.IOUtils,
  System.Character,
  System.Generics.Collections,
  System.UIConsts,
  System.Threading,

  Androidapi.Jni.Net, // Required
  Androidapi.Jni.JavaTypes, // Required
  Androidapi.Helpers, // Required
  Androidapi.Jni.GraphicsContentViewText, // Required
  Androidapi.Jni.App, // Required
  System.Messaging, // Required
  System.JSON, // Required
  Androidapi.Jni.OS, // Required

  FMX.Surfaces,

  FMX.Platform,

  StrUtils,
  uFormat,

  System.RegularExpressions, FMX.Layouts, FMX.ScrollBox, FMX.Memo;

const

  NORMAL = false;
  BOLD = true;

  COMANDO_VENDA = '1';
  COMANDO_CANCELAMENTO = '2';
  COMANDO_FUNCOES = '3';
  COMANDO_REIMPRESSAO = '4';

  FLAG_DESABILITA_IMPRESSAO = '0';
  FLAG_HABILITA_IMPRESSAO = '1';

  PRODUTO_TODOS = '0';
  PRODUTO_CREDITO = '1';
  PRODUTO_DEBITO = '2';
  PRODUTO_CARTEIRA_DIGITAL = '3';

  PARCELAMENTO_NONE = '0';
  PARCELAMENTO_LOJA = '1';
  PARCELAMENTO_ADM = '3';

  REQ_CODE = 4321;

  EXAMPLE_VERSION = 'V0.0';

  RETORNO_INICIAL = -1;
  GER7_RETORNO_REIMPRESSAO = 0;
  GER7_RETORNO_ENVIAR = 1;
  MSITEF_RETORNO_REIMPRESSAO = 2;
  MSITEF_RETORNO_ENVIAR = 3;

  NAO_REIMPRIMIR = 0;
  SIM_REIMPRIMIR = 1;

  // Ger7

  GER7_REQ_URI = 'pos7api://pos7';
  GER7_REQ_TAG = 'jsonReq';
  GER7_RES_TAG = 'jsonResp';
  GER7_FORM_FEED = #12;
  GER7_REQ_CODE = 4713;
  GER7_REIMPRESSAO = '18';
  GER7_VOUCHER = '4';
  GER7_PARCELADO_ADM = '2';
  VERSION = 'GER7TEF Api UEA';

  API_GER7 = '0';
  API_MSITEF = '1';

type
  TfrmTEF = class(TForm)
    lblTitulo: TLabel;
    edtIPServidor: TEdit;
    edtValor: TEdit;
    lblValor: TLabel;
    lblIP: TLabel;
    edtParcelas: TNumberBox;
    grpFormaPagamento: TGroupBox;
    rdgCredito: TRadioButton;
    rdgDebito: TRadioButton;
    rdgTodos: TRadioButton;
    lblParcelas: TLabel;
    cmdEnviarTransacao: TButton;
    cmdCancelarTransacao: TButton;
    cmdFuncoes: TButton;
    cmdReimpressao: TButton;
    grpParcelamento: TGroupBox;
    rdgParceladoLoja: TRadioButton;
    rdgParceladoAdm: TRadioButton;
    meResposta: TMemo;
    Label1: TLabel;
    rdgCarteira: TRadioButton;

    procedure cmdEnviarTransacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtParcelasKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure cmdCancelarTransacaoClick(Sender: TObject);
    procedure cmdFuncoesClick(Sender: TObject);

    procedure cmdReimpressaoClick(Sender: TObject);
    procedure InvocarFuncao(Funcao: String);

    function OnActivityResult(RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    procedure ExecuteSiTEF(Tipo, NotUsed, Amount, Parcelas, TipoParcelamento, Product, HabilitaImpressao: string);

    procedure edtValorChange(Sender: TObject);
    procedure rdgDebitoChange(Sender: TObject);
    procedure rdgCreditoChange(Sender: TObject);

    procedure rdgTodosChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);



  private

    function checkRegex(txt: String): Boolean;
    function ValidaIP(): Boolean;
    function GetID(): string;


  public

    procedure ImprimirCupom(via_estabelecimento, via_cliente : string);
    procedure MostarRetorno(retorno: string);

  end;

var
  frmTEF: TfrmTEF;
  ExecFlag: Boolean; // Evita entrada em redundancia
  FMessageSubscriptionID: Integer;

  strId: string;
  strArqId: string;

  TEFExecuteFlag: Integer;

  ValorBruto: String;

  constFunc: Integer;
  cip: Integer;

  // auxiliares
  controleRetorno: Integer;
  auxR: string;
  exibirDialogoTransacaoNegadaMsitef: integer;


implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
// ==========================================



// **********************************************
function getVersion: string;
begin
  result := VERSION;
end;

procedure TfrmTEF.edtParcelasKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  grpParcelamento.Enabled := (StrToIntDef(edtParcelas.Text, 0) > 1);
end;

procedure TfrmTEF.edtValorChange(Sender: TObject);
begin
  Formatar(edtValor, TFormato.Valor)
end;

// ==========================================================
procedure TfrmTEF.FormActivate(Sender: TObject);
begin
  edtParcelas.Text := '1';
  cip := 0;
  controleRetorno := RETORNO_INICIAL;

end;

procedure TfrmTEF.FormCreate(Sender: TObject);
begin

  edtValor.Text := '10,00';

  ExecFlag := false;
end;

function GetExtraData(Data: JIntent; Campo: String): String;
begin
  result := Campo + ' = ' + JStringToString(Data.getStringExtra(StringToJString(Campo)));
end;

// ==========================================================
function RetornaTipoParcelamento(Valor: string): string;
var
  iValor: Integer;
begin
  iValor := StrToIntDef(Valor, 4);

  case iValor of
    0:
      result := 'A vista';
    1:
      result := 'Pré-Datado';
    2:
      result := 'Parcelado Loja';
    3:
      result := 'Parcelado Adm';
  else
    result := 'Valor invalido';
  end; // case

end;


procedure Dialogo(Titulo: string; Confirmacao: Boolean; Callback : TInputCloseDialogProc);
var
  dialogoTipo: TMsgDlgType;
  botoes: TMsgDlgButtons;
begin

   if Confirmacao then
   begin
      dialogoTipo := System.UITypes.TMsgDlgType.mtConfirmation;
      botoes := [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo]
   end
   else
   begin
     dialogoTipo :=  System.UITypes.TMsgDlgType.mtInformation;
     botoes := [System.UITypes.TMsgDlgBtn.mbOk]
   end;

   TDialogService.MessageDialog( Titulo,
                                 dialogoTipo,
                                 botoes,
                                  System.UITypes.TMsgDlgBtn.mbOk,0,callback);

end;



procedure MostraTransacaoAprovadaMsitef(Data: JIntent);

begin

  // reimpressão
  if controleRetorno = MSITEF_RETORNO_REIMPRESSAO then
  begin

   frmTEF.ImprimirCupom(JStringToString(Data.getStringExtra(StringToJString('VIA_ESTABELECIMENTO'))),
                               JStringToString(Data.getStringExtra(StringToJString('VIA_CLIENTE'))));

  end
  else
    // enviar
    if controleRetorno = MSITEF_RETORNO_ENVIAR then
    begin

      Dialogo('Ação executada com sucesso!' + sLineBreak +
              GetExtraData(Data, 'CODRESP') + sLineBreak +
              GetExtraData(Data,'COMP_DADOS_CONF') + sLineBreak +
              GetExtraData(Data, 'CODTRANS') + sLineBreak +
              GetExtraData(Data, 'TIPO_PARC') + ' (' + RetornaTipoParcelamento(
                                            JStringToString(Data.getStringExtra (
                                            StringToJString('TIPO_PARC')))) + ')' + sLineBreak +
              GetExtraData(Data,'VLTROCO') + sLineBreak +
              GetExtraData(Data, 'REDE_AUT') + sLineBreak +
              GetExtraData(Data, 'BANDEIRA') + sLineBreak +
              GetExtraData(Data,'NSU_SITEF') + sLineBreak +
              GetExtraData(Data, 'NSU_HOST') + sLineBreak +
              GetExtraData(Data, 'COD_AUTORIZACAO') + sLineBreak +
              GetExtraData(Data, 'NUM_PARC') + sLineBreak,
              False,
        procedure(const AResult: TModalResult)
        begin

          if (AResult = mrOk) then
          begin

            frmTEF.ImprimirCupom(JStringToString(Data.getStringExtra(StringToJString('VIA_ESTABELECIMENTO'))),
                                JStringToString(Data.getStringExtra(StringToJString('VIA_CLIENTE'))));
          end;

        end);
    end;

end;

procedure MostraTransacaoNegadaMsitef(Data: JIntent); 
begin
  
  if (exibirDialogoTransacaoNegadaMsitef <> NAO_REIMPRIMIR) and Assigned(Data)  then
    frmTEF.MostarRetorno('Ocorreu um erro durante a execução!' + sLineBreak + GetExtraData(Data, 'CODRESP'))
  else
    ShowMessage('Transação cancelada');
    
end;

// ==========================================================
procedure TfrmTEF.cmdEnviarTransacaoClick(Sender: TObject);
var
  Produto, Parcelas, TipoParcelamento: String;
begin

  if edtValor.Text = '0,00' then
  begin
    ShowMessage('Insira um valor maior que R$0.0');
    exit;
  end;

  if StrToInt(edtParcelas.Text) = 0 then
  begin
    ShowMessage('Número de parcelas deve ser maior que 0');
    exit;
  end;

  try

    if rdgTodos.IsChecked then
      Produto := PRODUTO_TODOS
    else if rdgCredito.IsChecked then
      Produto := PRODUTO_CREDITO
    else if rdgDebito.IsChecked then
      Produto := PRODUTO_DEBITO
    else if rdgCarteira.IsChecked then
      Produto := PRODUTO_CARTEIRA_DIGITAL;

    Parcelas := IntToStr(StrToIntDef(edtParcelas.Text, 0));

    if ((Parcelas = '0') or (Parcelas = '1')) then
      TipoParcelamento := PARCELAMENTO_NONE
    else
    begin
      if rdgParceladoLoja.IsChecked then
        TipoParcelamento := PARCELAMENTO_LOJA
      else if rdgParceladoAdm.IsChecked then
          TipoParcelamento := PARCELAMENTO_ADM;
    end;

    ValorBruto := SomenteNumero(edtValor.Text);

    // Aceita enredeço de IP entre 0..255
    if not ValidaIP then
        exit;

    controleRetorno := MSITEF_RETORNO_ENVIAR; // R
    exibirDialogoTransacaoNegadaMsitef := SIM_REIMPRIMIR;
    ExecuteSiTEF(COMANDO_VENDA, '', ValorBruto, Parcelas, TipoParcelamento,
        Produto, FLAG_DESABILITA_IMPRESSAO);

  except
    on e: exception do
    begin
      frmTEF.MostarRetorno('Erro Transacao =>' + e.Message);
    end;

  end;

  { }

end;

function TfrmTEF.checkRegex(txt: string): Boolean;
var
  IpTxt: string;
begin
  IpTxt := '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$\b';
  result := TRegEx.IsMatch(txt, IpTxt);
end;

procedure TfrmTEF.cmdCancelarTransacaoClick(Sender: TObject);
begin

    try

      // Aceita enredeço de IP entre 0..255
      if not ValidaIP then
        exit;


      controleRetorno := MSITEF_RETORNO_ENVIAR;
      exibirDialogoTransacaoNegadaMsitef := SIM_REIMPRIMIR;
      InvocarFuncao(COMANDO_CANCELAMENTO)

    except
      on e: exception do
      begin
        frmTEF.MostarRetorno('Erro Cancelamento =>' + e.Message);
      end;

    end;


end;

procedure TfrmTEF.ImprimirCupom(via_estabelecimento, via_cliente: string);
begin
      frmTEF.MostarRetorno( via_estabelecimento +  sLineBreak  + sLineBreak + via_cliente );
end;

procedure TfrmTEF.InvocarFuncao(Funcao: String);
begin
    try

      ExecuteSiTEF(Funcao, '', '', '', '', '', FLAG_DESABILITA_IMPRESSAO);

    except
      on e: exception do
      begin
        frmTEF.MostarRetorno('Erro Funcoes =>' + e.Message);
      end;
    end;

end;

procedure TfrmTEF.MostarRetorno(retorno: string);
var
espacamento, DataAtual : string;
begin
  espacamento := espacamento + sLineBreak;
  espacamento := espacamento + '---------------------------------------------------------------------------------------------------------';
  espacamento := espacamento + sLineBreak;
  DataAtual := FormatDateTime('dd/mm/yyyy', Now) + ' ' + TimeToStr(Now);
  meResposta.Text := DataAtual + sLineBreak + retorno + espacamento;
end;

function TfrmTEF.GetID: string;
begin
  GetID := IntToStr(Round(random(99999)))
end;

procedure TfrmTEF.cmdFuncoesClick(Sender: TObject);
begin

    if not ValidaIP then
      exit;

    exibirDialogoTransacaoNegadaMsitef := NAO_REIMPRIMIR;
    InvocarFuncao(COMANDO_FUNCOES)

end;

procedure TfrmTEF.cmdReimpressaoClick(Sender: TObject);
begin


    if not ValidaIP then
      exit;

    controleRetorno := MSITEF_RETORNO_REIMPRESSAO;
    exibirDialogoTransacaoNegadaMsitef := NAO_REIMPRIMIR;

    InvocarFuncao(COMANDO_REIMPRESSAO);


end;
// ************************************************

procedure TfrmTEF.rdgCreditoChange(Sender: TObject);
begin
  edtParcelas.Enabled := true;
end;

procedure TfrmTEF.rdgDebitoChange(Sender: TObject);
begin
  edtParcelas.Text := '1';
  edtParcelas.Enabled := false;
end;

procedure TfrmTEF.rdgTodosChange(Sender: TObject);
begin
  edtParcelas.Text := '1';
  edtParcelas.Enabled := false;
end;

function TfrmTEF.ValidaIP(): Boolean;
begin
  if (checkRegex(edtIPServidor.Text)) then
    exit(true)
  else
    ShowMessage('Erro ao Executar a função' + sLineBreak + sLineBreak +
      'Digite um IP válido');

  ValidaIP := false;
end;

// **********************************************
// Recebe resposta das Intents do Msitef
//
function TfrmTEF.OnActivityResult(RequestCode, ResultCode: Integer;
Data: JIntent): Boolean;
var
  JSON: JString;
  objJson: TJSONObject;
  CupomImpresso: string;
  iPos: Integer;
begin
  result := false;
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, FMessageSubscriptionID);
  FMessageSubscriptionID := 0;
   
  if RequestCode = REQ_CODE then
  begin
     
    if ResultCode = TJActivity.JavaClass.RESULT_OK then
    begin

      if Assigned(Data) then
      begin

        if (ExecFlag) then
        begin
          ExecFlag := false;
          TThread.Synchronize(nil,
            procedure
            begin
              MostraTransacaoAprovadaMsitef(Data);
            end);

          // RandomValor;
        end;
      end;
    end
    else if ResultCode = TJActivity.JavaClass.RESULT_CANCELED then
    begin
       
      if (ExecFlag) then
      begin
        MostraTransacaoNegadaMsitef(Data);
        ExecFlag := false;
      end;
    end
    else
    begin
      if (ExecFlag) then
      begin
        ShowMessage('m-SiTef Outro Codigo');
        ExecFlag := false;
      end;
    end;
    // RandomValor;

    result := true;
  end;


end;



// **********************************************


procedure TfrmTEF.HandleActivityMessage(const Sender: TObject;
const M: TMessage);
begin

  
  try
  if M is TMessageResultNotification then
    OnActivityResult(TMessageResultNotification(M).RequestCode,
      TMessageResultNotification(M).ResultCode,
      TMessageResultNotification(M).Value);
    
  except
      on e: exception do
        ShowMessage('erro: ' + e.Message);
  end;
  
end;

// **********************************************
// ==========================================================
//
//  Faz chamada a Intent do Msitef, passando os parâmetros necessários
//  para o processamento das transações
//  Resultado será recebido pela OnActivityResult
//
//
procedure TfrmTEF.ExecuteSiTEF(Tipo, NotUsed, Amount, Parcelas,
  TipoParcelamento, Product, HabilitaImpressao: string);
var
  Intent: JIntent;
begin
  edtIPServidor.Text := StringReplace(edtIPServidor.Text, ' ', EmptyStr,
    [rfReplaceAll]);
  ExecFlag := true;
  Intent := TJIntent.JavaClass.init
    (StringToJString('br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF'));

  Intent.putExtra(StringToJString('empresaSitef'), StringToJString('00000000'));
  Intent.putExtra(StringToJString('enderecoSitef'), StringToJString(edtIPServidor.Text));
  Intent.putExtra(StringToJString('operador'), StringToJString('0001'));
  Intent.putExtra(StringToJString('data'), StringToJString(FormatDateTime('yyyyMMdd', Date)));
  Intent.putExtra(StringToJString('hora'), StringToJString(FormatDateTime('hhmmss', Time)));
  Intent.putExtra(StringToJString('numeroCupom'), StringToJString('1234'));
  Intent.putExtra(StringToJString('valor'), StringToJString(Amount));
  Intent.putExtra(StringToJString('CNPJ_CPF'), StringToJString('03654119000176'));
  Intent.putExtra(StringToJString('comExterna'), StringToJString('0'));

  case Tipo[0] of
    COMANDO_VENDA:
      begin
        if Product = PRODUTO_CREDITO then
        begin
          Intent.putExtra(StringToJString('modalidade'), StringToJString('3'));
          case TipoParcelamento[0] of
            PARCELAMENTO_NONE:
              begin
                Intent.putExtra(StringToJString('transacoesHabilitadas'),
                  StringToJString('26'));
              end;
            PARCELAMENTO_LOJA:
              begin
                Intent.putExtra(StringToJString('transacoesHabilitadas'),
                  StringToJString('27'));
              end;
            PARCELAMENTO_ADM:
              begin
                Intent.putExtra(StringToJString('transacoesHabilitadas'),
                  StringToJString('28'));
              end;
          end;
          Intent.putExtra(StringToJString('numParcelas'),
            StringToJString(Parcelas));

        end
        else if Product = PRODUTO_DEBITO then
        begin
          Intent.putExtra(StringToJString('modalidade'), StringToJString('2'));
          Intent.putExtra(StringToJString('transacoesHabilitadas'), StringToJString('16'));
        end
        else if Product = PRODUTO_TODOS then
        begin
          Intent.putExtra(StringToJString('modalidade'), StringToJString('0'));
          Intent.putExtra(StringToJString('restricoes'), StringToJString('transacoesHabilitadas=16'));
        end
        else if Product = PRODUTO_CARTEIRA_DIGITAL then
        begin
          Intent.putExtra(StringToJString('modalidade'), StringToJString('122'));
          Intent.putExtra(StringToJString('restricoes'), StringToJString('transacoesHabilitadas=7;8'));
        end;
      end;

    COMANDO_CANCELAMENTO:
      begin
        Intent.putExtra(StringToJString('modalidade'), StringToJString('200'));
      end;

    COMANDO_FUNCOES:
      begin
        Intent.putExtra(StringToJString('modalidade'), StringToJString('110'));
        Intent.putExtra(StringToJString('restricoes'), StringToJString('transacoesHabilitadas=16;26;27'));
      end;

    COMANDO_REIMPRESSAO:
      begin
        Intent.putExtra(StringToJString('modalidade'), StringToJString('114'));
      end;
  end;

  Intent.putExtra(StringToJString('isDoubleValidation'), StringToJString('0'));
  Intent.putExtra(StringToJString('caminhoCertificadoCA'), StringToJString('ca_cert_perm'));

  // Removida esta opção - v3.70
  // Intent.putExtra(StringToJString('comprovante'), StringToJString(HabilitaImpressao));

  TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);
  TAndroidHelper.Activity.startActivityForResult(Intent, REQ_CODE);

end;



end.
