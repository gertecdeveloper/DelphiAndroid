unit RetornoSAT;

interface
uses
  System.Classes,FMX.Graphics,sysutils, System.NetEncoding,
  FMX.Dialogs, Utils;

type
  TRetornoSAT = class
  private
     FRetornoPipe: TStringList;
     FOperacao : integer;
     FRetornoDiferente: boolean;
     FRetornoPipeCompleto: string;


  public

    constructor Create(tipo: integer; retornoPipe: string);

    procedure Show;
    function  Dados(index: integer): string;
    function  ExisteErroResposta(): boolean;
    function  GetErroSat(): string;
    function  GetOperacao(): integer;
    function  GetMensagem(): string;
    function  GetNumeroSessao(): string;
    function  GetNumeroEEEE(): string;

    // Dado somente presente na três funções(AssociarSAT, Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetNumeroCCCC(): string;
    function  GetNumeroCod(): string;
    function  GetMensagemSefaz(): string;

    // Dado exclusivo do retorno da operação Ativar Sat
    function  GetCodigoCSR(): string;

    // Dado exclusivo do retorno da operação Extrair Log
    function  GetLogBase64(): string;

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetArquivoCFeBase64(): string;

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetTimeStamp(): string;

     // Dado exclusivo do retorno da operação TEnviarTesteFim
    function  GetNumDocFiscal(): string;

    // Dado somente presente na três funções(EnviarTesteFim, Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetChaveConsulta(): string;

     // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetValorTotalCFe(): string;

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetCPFCNPJValue(): string;

    // Dado somente presente nas funções(Enviar Teste Venda e Cancelar Ultima Venda)
    function  GetAssinaturaQRCODE(): string;

    function  GetEstadoDeOperacao(): string;

    function GetNumeroSerieSat: string;
    function GetTipoLan: string;
    function GetIpSat: string;
    function GetMacSat: string;
    function GetMascara: string;
    function GetGateway : string;
    function GetDns1 : string;
    function GetDns2 : string;
    function GetStatusRede : string;
    function GetNivelBateria : string;
    function GetMemoriaDeTrabalhoTotal : string;
    function GetMemoriaDeTrabalhoUsada : string;
    function GetDataHora: string;
    function GetVersao : string;
    function GetVersaoLeiaute : string;
    function GetUltimoCfeEmitido : string;
    function GetPrimeiroCfeMemoria : string;
    function GetUltimoCfeMemoria : string;
    function GetUltimaTransmissaoSefazDataHora :string;
    function GetUltimaComunicacaoSefazData: string;
    function GetDataEmissaoCertificado : string;
    function GetDataVencimentoCertificado : string;

    function  Base64ToStr(encodedBase64: string): string;

    function FormataData(data: string) :string;

  end;

implementation



{ TRetornoSAT }

function TRetornoSAT.Base64ToStr(encodedBase64: string): string;
var  bytes: TBytes;
begin
   bytes := TNetEncoding.Base64.DecodeStringToBytes(encodedBase64);
   Base64ToStr := TEncoding.ASCII.GetString( bytes );
end;

constructor TRetornoSAT.Create(tipo: integer; retornoPipe: string);
begin
      FRetornoPipeCompleto := retornoPipe;
      FOperacao := tipo;

      FRetornoPipe := TStringList.Create;
      FRetornoPipe.StrictDelimiter:=True;
      FRetornoPipe.Delimiter := '|';
      FRetornoPipe.DelimitedText := retornoPipe;

      case FOperacao of
           TIPO_ASSOCIAR_ASSINATURA,
           TIPO_ENVIAR_DADOS_VENDA,
           TIPO_CANCELAR_ULTIMA_VENDA: FRetornoDiferente := True;
      else
          FRetornoDiferente := False;
      end;

end;

function TRetornoSAT.Dados(index: integer): string;
begin
    if ((index >= 0) and (index < FRetornoPipe.Count))  then
       Dados := FRetornoPipe[index]
    else
       Dados := '';

end;

function TRetornoSAT.ExisteErroResposta: boolean;
begin
      if (FRetornoPipe.Count <= 1) then
         ExisteErroResposta := True
      else ExisteErroResposta := False;
end;

function TRetornoSAT.FormataData(data: string): string;
begin
// string pascal comeca no 1
       FormataData := copy(data,7, 2) +
                '/' + copy(data,5, 2) +
                '/' + copy(data,1, 4) +
                ' ' + copy(data,9, 2) +
                ':' + copy(data,11, 2) +
                ':' + copy(data,13, 2);

end;

function TRetornoSAT.GetErroSat: string;
begin
    if ExisteErroResposta then
    begin
       if Dados(0) = 'com.phi.gertec.sat.satger.SatGerConnectionManager$ConnectionFailedException: Failed to find SAT device.' then
             Exit('Dispositivo SAT não localizado')
        else
             Exit(Dados(0));
    end;


    if ((GetMensagem() = 'Codigo de ativação inválido')
     or (GetMensagem() = 'Codigo ativação inválido')) then
          Exit(GetMensagem());

    GetErroSat := '';

end;

function TRetornoSAT.GetEstadoDeOperacao: string;
begin
        case StrToInt(Dados(27)) of
             0: GetEstadoDeOperacao := 'DESBLOQUEADO';
             1: GetEstadoDeOperacao := 'BLOQUEADO SEFAZ';
             2: GetEstadoDeOperacao := 'BLOQUEIO CONTRIBUINTE';
             3: GetEstadoDeOperacao := 'BLOQUEIO AUTÔNOMO';
             4: GetEstadoDeOperacao := 'BLOQUEIO PARA DESATIVAÇÃO';
        else
           GetEstadoDeOperacao := '';
        end;
end;

function TRetornoSAT.GetGateway: string;
begin
       GetGateway := Dados(10);
end;

function TRetornoSAT.GetIpSat: string;
begin
     GetIpSat := Dados(7);
end;

function TRetornoSAT.GetArquivoCFeBase64: string;
begin
    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA :
            GetArquivoCFeBase64 := Base64ToStr(Dados(6));
        TIPO_TESTE_FIM_A_FIM:
            GetArquivoCFeBase64 := Base64ToStr(Dados(5));
    else
        GetArquivoCFeBase64 := '';
    end;
end;

function TRetornoSAT.GetAssinaturaQRCODE: string;
begin
    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA :
            GetAssinaturaQRCODE := Dados(11);
    else
        GetAssinaturaQRCODE := '';
    end;

end;

function TRetornoSAT.GetChaveConsulta: string;
begin

    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA,
        TIPO_TESTE_FIM_A_FIM :
            GetChaveConsulta := Dados(8);
    else
        GetChaveConsulta := '';
    end;

end;

function TRetornoSAT.GetCodigoCSR: string;
begin
     if FOperacao = TIPO_ATIVAR_SAT then
          GetCodigoCSR := Dados(5)
      else
          GetCodigoCSR := '';
end;

function TRetornoSAT.GetCPFCNPJValue: string;
begin
    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA :
            GetCPFCNPJValue := Dados(10);
    else
        GetCPFCNPJValue := '';
    end;
end;

function TRetornoSAT.GetDataEmissaoCertificado: string;
begin
      GetDataEmissaoCertificado := Dados(25);
end;

function TRetornoSAT.GetDataHora: string;
begin
      GetDataHora := FormataData(Dados(17));
end;

function TRetornoSAT.GetDataVencimentoCertificado: string;
begin
      GetDataVencimentoCertificado := Dados(26);
end;

function TRetornoSAT.GetDns1: string;
begin
       GetDns1 :=  Dados(11);
end;

function TRetornoSAT.GetDns2: string;
begin
      GetDns2 :=  Dados(12);
end;

function TRetornoSAT.GetLogBase64: string;
begin
      if FOperacao = TIPO_EXTRAIR_LOGS then
          GetLogBase64 := Dados(5)
      else
          GetLogBase64 := '';

end;

function TRetornoSAT.GetMacSat: string;
begin
      GetMacSat := Dados(8);
end;

function TRetornoSAT.GetMascara: string;
begin
       GetMascara :=  Dados(9);
end;

function TRetornoSAT.GetMemoriaDeTrabalhoTotal: string;
begin
     GetMemoriaDeTrabalhoTotal := Dados(15);
end;

function TRetornoSAT.GetMemoriaDeTrabalhoUsada: string;
begin
     GetMemoriaDeTrabalhoUsada := Dados(16);
end;

function TRetornoSAT.GetMensagem: string;
begin
      if FRetornoDiferente then
          GetMensagem := Dados(3)
      else
          GetMensagem := Dados(2);
end;

function TRetornoSAT.GetMensagemSefaz: string;
begin
      if FRetornoDiferente then
          GetMensagemSefaz := Dados(5)
      else
          GetMensagemSefaz := Dados(4);
end;

function TRetornoSAT.GetNivelBateria: string;
begin
       GetNivelBateria := Dados(14);
end;

function TRetornoSAT.GetNumDocFiscal: string;
begin
      if FOperacao = TIPO_TESTE_FIM_A_FIM then
          GetNumDocFiscal := Dados(7)
      else
          GetNumDocFiscal := '';
end;

function TRetornoSAT.GetNumeroCCCC: string;
begin
      if FRetornoDiferente then
          GetNumeroCCCC := Dados(2)
      else
          GetNumeroCCCC := '';

end;

function TRetornoSAT.GetNumeroCod: string;
begin
      if FRetornoDiferente then
          GetNumeroCod := Dados(4)
      else
          GetNumeroCod := Dados(3);

end;

function TRetornoSAT.GetNumeroEEEE: string;
begin
       GetNumeroEEEE := Dados(1);
end;

function TRetornoSAT.GetNumeroSerieSat: string;
begin
      GetNumeroSerieSat := Dados(5);
end;

function TRetornoSAT.GetNumeroSessao: string;
begin
      GetNumeroSessao := Dados(0);
end;

function TRetornoSAT.GetOperacao: integer;
begin
     GetOperacao :=  FOperacao;
end;

function TRetornoSAT.GetPrimeiroCfeMemoria: string;
begin
          GetPrimeiroCfeMemoria := Dados(21);
end;

function TRetornoSAT.GetStatusRede: string;
begin
      GetStatusRede := Dados(13);
end;

function TRetornoSAT.GetTimeStamp: string;
begin
    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA :
            GetTimeStamp := Dados(7);
        TIPO_TESTE_FIM_A_FIM:
            GetTimeStamp := Dados(6);
    else
        GetTimeStamp := '';
    end;

end;

function TRetornoSAT.GetTipoLan: string;
begin
      GetTipoLan :=  Dados(6);
end;

function TRetornoSAT.GetUltimaComunicacaoSefazData: string;
begin
      GetUltimaComunicacaoSefazData := FormataData(Dados(24));
end;

function TRetornoSAT.GetUltimaTransmissaoSefazDataHora: string;
begin
       GetUltimaTransmissaoSefazDataHora := FormataData(Dados(23));
end;

function TRetornoSAT.GetUltimoCfeEmitido: string;
begin
       GetUltimoCfeEmitido := Dados(20);
end;

function TRetornoSAT.GetUltimoCfeMemoria: string;
begin
       GetUltimoCfeMemoria := Dados(22);
end;

function TRetornoSAT.GetValorTotalCFe: string;
begin
    case FOperacao of

        TIPO_ENVIAR_DADOS_VENDA,
        TIPO_CANCELAR_ULTIMA_VENDA :
            GetValorTotalCFe := Dados(9);
    else
        GetValorTotalCFe := '';
    end;

end;

function TRetornoSAT.GetVersao: string;
begin
         GetVersao :=  Dados(18);
end;

function TRetornoSAT.GetVersaoLeiaute: string;
begin
         GetVersaoLeiaute := Dados(19);
end;

procedure TRetornoSAT.Show;
//var i : integer;
begin
     //for i:=0 to FRetornoPipe.Count-1  do
         ShowMessage(IntToStr(FRetornoPipe.Count));
         ShowMessage(FRetornoPipe[0]);


end;

end.
