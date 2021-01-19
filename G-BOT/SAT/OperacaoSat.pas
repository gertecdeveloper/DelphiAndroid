unit OperacaoSat;

interface
uses
  System.Classes,FMX.Graphics,sysutils,
  FMX.Dialogs, RetornoSat, Utils;

  function InvocarOperacaoSat(tipo: integer; respostaSat: string): TRetornoSAT;
  function FormataRetornoSat(retornoSat : TRetornoSAT): string;
  function ConverterBase64EmXml(base64Sat : string): string;



implementation

function InvocarOperacaoSat(tipo: integer; respostaSat: string): TRetornoSAT;
begin
       InvocarOperacaoSat := TRetornoSAt.Create(tipo,respostaSat);
end;


// Função que retorna uma String formatada para ser posta no dialogo Sat, com todas as informações do retorno da operação realizada
// Em caso de erro retorna o erro
// *Existem operações que vão ter como resultado informações semelhantes

function FormataRetornoSat(retornoSat : TRetornoSAT): string;
var retornoFormatado : string;
begin
    retornoFormatado := '';

    if not (retornoSat.GetErroSat = '') then
           FormataRetornoSat := 'Mensagem: ' + retornoSat.GetErroSat
    else
      begin
          //* Estas informações são padrões a todos os retornos(sempre vão aparecer no Dialogo Sat)
          //* Para mais informações consulte o arquivo retornosSat.txt. É possivel visualizar nele a posição e informação de cada Retorno do Sat.
          if not (retornoSat.GetNumeroCCCC = '') then
            begin
                retornoFormatado := retornoSat.GetNumeroEEEE + '|' + retornoSat.GetNumeroCCCC + '-'
            end
          else
             retornoFormatado := retornoSat.GetNumeroEEEE + '|';

          retornoFormatado := retornoFormatado + retornoSat.GetMensagem + sLineBreak;

          // Verifica se adiciona o Código e Mensagem Sefaz na mensagem, caso não estejam vazios
          if not ((retornoSat.GetNumeroCod = '') or (retornoSat.GetMensagemSefaz = ''))  then
              retornoFormatado := retornoFormatado + 'Cod/Mens Sefaz: ' + sLineBreak + retornoSat.getNumeroCod + '-' + retornoSat.getMensagemSefaz
          else if not (retornoSat.GetNumeroCod = '') then
              retornoFormatado := retornoFormatado + 'Cod/Mens Sefaz: '+ sLineBreak + retornoSat.getNumeroCod + '-'
          else if not (retornoSat.GetMensagemSefaz = '') then
              retornoFormatado := retornoFormatado + 'Cod/Mens Sefaz: '+ sLineBreak + retornoSat.GetMensagemSefaz;

          retornoFormatado := retornoFormatado + sLineBreak; // Pula linha


          //* Agora só são inseridas as informações que não são padrões a todos retornos
          //* São atribuidas as informações especificas do retorno da operação

          if (retornoSat.GetOperacao = TIPO_ATIVAR_SAT) then
          begin
                if not (retornoSat.GetCodigoCSR = '') then
              begin
                  retornoFormatado := retornoFormatado + 'CSR: ' + retornoSat.getCodigoCSR;
              end
          end
          //else if (retornoSat.GetOperacao = retornoSat.TIPO_EXTRAIR_LOGS) then
              //! Cuidado com está parte, ela pode  exigir muito processamento se estiver em modo Debug
              //! Recomenda-se que utilize somente em modo release e não colocar em um Dialogo, pois o arquivo retornado é grande
              // retornoFormatado := retornoFormatado + 'Arquivo de log em base64: ' + retornoSat.getLogBase64;
          else if (retornoSat.GetOperacao = TIPO_CONSULTAR_STATUS_OPERACIONAL) then
          begin
              retornoFormatado := retornoFormatado + '------- Conteúdo Retorno -------' +
                            sLineBreak +
                            'Número de Série do SAT: ' +
                            retornoSat.GetNumeroSerieSat +
                            'Tipo de Lan: ' +
                            retornoSat.GetTipoLan +
                            sLineBreak +
                            'IP SAT: ' +
                            retornoSat.GetIpSat +
                            sLineBreak +
                            'MAC SAT: ' +
                            retornoSat.GetMacSat +
                            sLineBreak +
                            'Máscara: ' +
                            retornoSat.GetMascara +
                            sLineBreak +
                            'Gateway: ' +
                            retornoSat.GetGateway +
                            sLineBreak +
                            'DNS 1: ' +
                            retornoSat.GetDns1 +
                            sLineBreak +
                            'DNS 2: ' +
                            retornoSat.GetDns2 +
                            sLineBreak +
                            'Status da Rede: ' +
                            retornoSat.GetStatusRede +
                            sLineBreak +
                            'Nível da Bateria: ' +
                            retornoSat.GetNivelBateria +
                            sLineBreak +
                            'Memória de Trabalho Total: ' +
                            retornoSat.GetMemoriaDeTrabalhoTotal +
                            sLineBreak +
                            'Memória de Trabalho Usada: ' +
                            retornoSat.GetMemoriaDeTrabalhoUsada +
                            sLineBreak +
                            'Data/Hora: ' +
                            retornoSat.GetDataHora +
                            sLineBreak +
                            'Versão: ' +
                            retornoSat.GetVersao +
                            sLineBreak +
                            'Versão de Leiaute: ' +
                            retornoSat.GetVersaoLeiaute +
                            sLineBreak +
                            'Último CFe-Sat Emitido: ' +
                            retornoSat.GetUltimoCfeEmitido +
                            sLineBreak +
                            'Primeiro CFe-Sat Em Memória: ' +
                            retornoSat.GetPrimeiroCfeMemoria +
                            sLineBreak +
                            'Último CFe-Sat Em Memória: ' +
                            retornoSat.GetUltimoCfeMemoria +
                            sLineBreak +
                            'Última Transmissão de CFe-SAT para SEFAZ: ' +
                            retornoSat.GetUltimaTransmissaoSefazDataHora +
                            sLineBreak +
                            'Última Comunicacao com a SEFAZ:' +
                            retornoSat.GetUltimaComunicacaoSefazData +
                            sLineBreak +
                            'Data de emissão do certificado: ' +
                            retornoSat.GetDataEmissaoCertificado +
                            sLineBreak +
                            'Data de vencimento do certificado: ' +
                            retornoSat.GetDataVencimentoCertificado +
                            sLineBreak +
                            'Estado de Operação do SAT: ' +
                            retornoSat.GetEstadoDeOperacao
          end
          //else if (retornoSat.GetOperacao = retornoSat.TIPO_ASSOCIAR_ASSINATURA) then
               //* Associar SAT somente tem como dado especifico o campo CCCC(fica ao seu criterio adicionar-lo ou não)
          else if (retornoSat.GetOperacao = TIPO_TESTE_FIM_A_FIM) then
          begin
               retornoFormatado := retornoFormatado + 'TimeStamp: ' +
                            retornoSat.GetTimeStamp +
                            sLineBreak +
                            'Num Doc Fiscal: ' +
                            retornoSat.GetNumDocFiscal +
                            sLineBreak +
                            'Chave de Consulta: ' +
                            retornoSat.GetChaveConsulta +
                            sLineBreak +
                            'Arquivo CFE Base 64: ' +
                            ConverterBase64EmXml(retornoSat.GetArquivoCFeBase64)
          end
          else if ((retornoSat.GetOperacao = TIPO_ENVIAR_DADOS_VENDA)
                or (retornoSat.GetOperacao = TIPO_CANCELAR_ULTIMA_VENDA)) then
          begin
                 retornoFormatado := retornoFormatado +  'TimeStamp: ' +
                            retornoSat.GetTimeStamp +
                            sLineBreak +
                            'Chave de Consulta: ' +
                            retornoSat.GetChaveConsulta +
                            sLineBreak +
                            'Valor CFE: ' +
                            retornoSat.GetValorTotalCFe +
                            sLineBreak +
                            'Valor CPF CNPJ: ' +
                            retornoSat.GetCPFCNPJValue +
                            sLineBreak +
                            'Arquivo CFE Base 64: ' +
                            ConverterBase64EmXml(retornoSat.GetArquivoCFeBase64) +
                            sLineBreak +
                            'Assinatura QRCODE: ' +
                            retornoSat.GetAssinaturaQRCODE;

           end;

          FormataRetornoSat :=  retornoFormatado;

      end;




end;

function ConverterBase64EmXml(base64Sat : string): string;
begin
   ConverterBase64EmXml := base64Sat;
end;

end.
