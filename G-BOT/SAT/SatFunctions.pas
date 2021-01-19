unit SatFunctions;

interface
uses
  System.Classes,FMX.Graphics,sysutils, System.NetEncoding,Androidapi.JNI.GraphicsContentViewText,
  FMX.Dialogs,
  //SAT
  SatInterfaces,
  Androidapi.Helpers,Androidapi.JNI.JavaTypes;

type
  TSatFunctions = class
  private
    serialComms: JSatGerLib;
    onDataReceived : JSatGerLib_OnDataReceived;

  public
    function AssociarAssinatura(NumeroSessao: integer; CodigoAtivacao: string; CNPJvalue: string; assinaturaCNPJs: string): string;
    function AtivarSAT(NumeroSessao: integer; CNPJ: string; cUF: string): string;
    function AtualizarSAT(NumeroSessao: integer; CodigoAtivacao: string): string;
    function BloquearSAT(NumeroSessao: integer; CodigoAtivacao: string): string;
    function CancelarUltimaVenda(NumeroSessao: integer; CodigoAtivacao: string; chave: string; dadosCancelamento: string): string;
    function ConfigurarInterfaceDeRede(NumeroSessao: integer; CodigoAtivacao: string; dadosConfiguracao: string): string;
    function ConsultarNumeroSessao(NumeroSessao: integer; CodigoAtivacao: string; cNumeroDeSessao: integer): string;
    function ConsultarSAT(NumeroSessao: integer): string;
    function ConsultarStatusOperacional(NumeroSessao: integer; CodigoAtivacao: string): string;
    function DesbloquearSAT(NumeroSessao: integer; CodigoAtivacao: string): string;
    function EnviarDadosVenda(NumeroSessao: integer; CodigoAtivacao: string; dadosVenda: string): string;
    function ExtrairLogs(NumeroSessao: integer; CodigoAtivacao: string): string;
    function TesteFimAFim(NumeroSessao: integer; CodigoAtivacao: string; dadosVenda: string): string;
    function TrocarCodigoDeAtivacao(NumeroSessao: integer; CodigoAtivacao: string; opcao: integer; novoCodigo: string; confNovoCodigo: string): string;
    function Versao: string;
    constructor Init(main_context: JContext);


  end;

implementation

{ TSatFunctions }

constructor TSatFunctions.Init(main_context: JContext);
begin

try
      serialComms := TJSatGerLib.JavaClass.init(main_context, onDataReceived);

      except on e: exception do
      begin
          ShowMessage(e.Message);
      end;

  end;
end;

function TSatFunctions.AssociarAssinatura(NumeroSessao: integer; CodigoAtivacao,
  CNPJvalue, assinaturaCNPJs: string): string;
begin
  try

    AssociarAssinatura := JStringToString(serialComms.AssociarAssinatura(NumeroSessao, StringToJString(CodigoAtivacao),StringToJString(CNPJvalue),StringToJString(assinaturaCNPJs)));

    except on e: exception do
    begin

     AssociarAssinatura := e.Message;
    end;

  end;
end;

function TSatFunctions.AtivarSAT(NumeroSessao: integer; CNPJ,
  cUF: string): string;
begin
  try

    AtivarSAT := JStringToString(serialComms.AtivarSAT(NumeroSessao,1,StringToJString(CNPJ),StringToJString(cUF),35));

    except on e: exception do
    begin

     AtivarSAT := e.Message;
    end;

  end;
end;

function TSatFunctions.AtualizarSAT(NumeroSessao: integer;
  CodigoAtivacao: string): string;
begin
  try

    AtualizarSAT := JStringToString(serialComms.AtualizarSAT(NumeroSessao,StringToJString(CodigoAtivacao)));

    except on e: exception do
    begin

     AtualizarSAT := e.Message;
    end;

  end;
end;

function TSatFunctions.BloquearSAT(NumeroSessao: integer;
  CodigoAtivacao: string): string;
begin
  try

    BloquearSAT := JStringToString(serialComms.BloquearSAT(NumeroSessao,StringToJString(CodigoAtivacao)));

    except on e: exception do
    begin

     BloquearSAT := e.Message;
    end;

  end;
end;

function TSatFunctions.CancelarUltimaVenda(NumeroSessao: integer;
  CodigoAtivacao, chave, dadosCancelamento: string): string;
begin
  try

     CancelarUltimaVenda  := JStringToString(serialComms.CancelarUltimaVenda(NumeroSessao,StringToJString(CodigoAtivacao),StringToJString(chave),StringToJString(dadosCancelamento)));

    except on e: exception do
    begin

     CancelarUltimaVenda := e.Message;
    end;

  end;
end;

function TSatFunctions.ConfigurarInterfaceDeRede(NumeroSessao: integer;
  CodigoAtivacao, dadosConfiguracao: string): string;
begin
  try

    ConfigurarInterfaceDeRede := JStringToString(serialComms.ConfigurarInterfaceDeRede(NumeroSessao, StringToJString(CodigoAtivacao),StringToJString(dadosConfiguracao)));

    except on e: exception do
    begin

     ConfigurarInterfaceDeRede := e.Message;
    end;

  end;
end;

function TSatFunctions.ConsultarNumeroSessao(NumeroSessao: integer;
  CodigoAtivacao: string; cNumeroDeSessao: integer): string;
begin
  try

    ConsultarNumeroSessao := JStringToString(serialComms.ConsultarNumeroSessao(NumeroSessao,StringToJString(CodigoAtivacao),cNumeroDeSessao));

    except on e: exception do
    begin

     ConsultarNumeroSessao := e.Message;
    end;

  end;
end;

function TSatFunctions.ConsultarSAT(NumeroSessao: integer): string;
begin
  try
     ConsultarSAT := JStringToString(serialComms.ConsultarSAT(NumeroSessao));

    except on e: exception do
    begin

     ConsultarSAT := e.Message;
    end;

  end;
end;

function TSatFunctions.ConsultarStatusOperacional(NumeroSessao: integer;
  CodigoAtivacao: string): string;
begin
  try
      ConsultarStatusOperacional :=  JStringToString(serialComms.ConsultarStatusOperacional(NumeroSessao,StringToJString(CodigoAtivacao)));

    except on e: exception do
    begin

     ConsultarStatusOperacional := e.Message;
    end;

  end;
end;

function TSatFunctions.DesbloquearSAT(NumeroSessao: integer;
  CodigoAtivacao: string): string;
begin
  try

    DesbloquearSAT :=  JStringToString(serialComms.DesbloquearSAT(NumeroSessao,StringToJString(CodigoAtivacao)));

    except on e: exception do
    begin

     DesbloquearSAT := e.Message;
    end;

  end;
end;

function TSatFunctions.EnviarDadosVenda(NumeroSessao: integer; CodigoAtivacao,
  dadosVenda: string): string;
begin
  try
      EnviarDadosVenda  :=  JStringToString(serialComms.EnviarDadosVenda(NumeroSessao,StringToJString(CodigoAtivacao),StringToJString(dadosVenda)));

    except on e: exception do
    begin

      EnviarDadosVenda := e.Message;
    end;

  end;
end;

function TSatFunctions.ExtrairLogs(NumeroSessao: integer;
  CodigoAtivacao: string): string;
begin
  try
     ExtrairLogs :=  JStringToString(serialComms.ExtrairLogs(NumeroSessao,StringToJString(CodigoAtivacao)));

  except on e: exception do
  begin

     ExtrairLogs := e.Message;
  end;

  end;
end;

function TSatFunctions.TesteFimAFim(NumeroSessao: integer; CodigoAtivacao,
  dadosVenda: string): string;
begin
  try
       TesteFimAFim :=  JStringToString(serialComms.TesteFimAFim(NumeroSessao,StringToJString(CodigoAtivacao),StringToJString(dadosVenda)));

    except on e: exception do
    begin

      TesteFimAFim := e.Message;
    end;

  end;
end;

function TSatFunctions.TrocarCodigoDeAtivacao(NumeroSessao: integer;
  CodigoAtivacao: string; opcao: integer; novoCodigo,
  confNovoCodigo: string): string;
begin
  try
     TrocarCodigoDeAtivacao := JStringToString(serialComms.TrocarCodigoDeAtivacao(NumeroSessao,StringToJString(CodigoAtivacao),opcao,StringToJString(novoCodigo),StringToJString(confNovoCodigo)));

    except on e: exception do
    begin
       TrocarCodigoDeAtivacao := e.Message;
    end;

  end;
end;

function TSatFunctions.Versao: string;
begin
  try
      Versao := JStringToString(serialComms.VersaoDllGerSAT);

      except on e: exception do
      begin
          Versao := e.Message;
      end;

  end;
end;

end.


