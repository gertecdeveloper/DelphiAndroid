unit Utils;

interface
uses
  System.Classes,FMX.Graphics,sysutils, System.NetEncoding,Androidapi.JNI.GraphicsContentViewText,
  FMX.Dialogs;

  function ValidaCodigoAtivacao(codeAtivacao: string): boolean;
  function LimpaCNPJ(cnpjCompleto: string): string;
  function GerarNumeroSessao(): integer;
  function DataAtual(): string;

  var
  CodigoAtivacao : string;
  CodigoCancelamento : string;
  CodigoSessao: integer;

type
  TDynamicArray = array of String;

//Tipos Operacao
    const TIPO_ASSOCIAR_ASSINATURA = 0;
    const TIPO_ENVIAR_DADOS_VENDA = 1;
    const TIPO_CANCELAR_ULTIMA_VENDA = 2;
    const TIPO_ATIVAR_SAT = 3;
    const TIPO_EXTRAIR_LOGS = 4;
    const TIPO_TESTE_FIM_A_FIM = 5;
    const TIPO_ATUALIZAR_SAT = 6;
    const TIPO_BLOQUEAR_SAT = 7;
    const TIPO_CONFIGURAR_INTERFACE_REDE = 8;
    const TIPO_CONSULTAR_NUMERO_SESSAO = 9;
    const TIPO_CONSULTAR_SAT = 10;
    const TIPO_CONSULTAR_STATUS_OPERACIONAL = 11;
    const TIPO_DESBLOQUEAR_SAT = 12;
    const TIPO_TROCAR_CODIGO_DE_ATIVACAO = 13;
    const TIPO_VERSAO = 14;

implementation

function ValidaCodigoAtivacao(codeAtivacao: string): boolean;
var maxLength,
    minLength : Integer;
begin
  if (codeAtivacao.Length >= 8) and (codeAtivacao.Length <= 32)  then begin
    ValidaCodigoAtivacao := true;
  end else begin
    ValidaCodigoAtivacao := false;
  end;
end;

function LimpaCNPJ(cnpjCompleto: string): string;
var
  cnpjLimpo, strA : String;
  charArray : Array of Char;
  strArray  : TDynamicArray;
  i         : Integer;
begin
  strA         := '03.654.119/0001-76';
  cnpjLimpo := '';

  charArray[0] := '.';
  charArray[1] := '/';
  charArray[2] := '-';

  LimpaCNPJ := cnpjLimpo;
end;

function GerarNumeroSessao(): integer;
begin
   CodigoSessao := Round(random(99999));
   GerarNumeroSessao := CodigoSessao;
end;

function DataAtual(): string;
begin
  DataAtual := FormatDateTime('dd/mm/yyyy', Now) + ' ' + TimeToStr(Now);
end;

end.
