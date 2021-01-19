unit TesteSat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit,
  FMX.StdCtrls, uFormat,
  //SAT
  SatFunctions,Utils,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FrameResposta;

type
  TfrmTesteSat = class(TForm)
    Label1: TLabel;
    edtCodeAtivacao: TEdit;
    buttonConsultaSat: TButton;
    buttonStatusOperacional: TButton;
    buttonFiaAFim: TButton;
    buttonDadosVenda: TButton;
    buttonCancelaVenda: TButton;
    buttonConsultaSessao: TButton;
    Layout1: TLayout;
    FrmResposta: TFrmResposta;
    procedure buttonConsultaSatClick(Sender: TObject);
    procedure buttonStatusOperacionalClick(Sender: TObject);
    procedure buttonFiaAFimClick(Sender: TObject);
    procedure buttonDadosVendaClick(Sender: TObject);
    procedure buttonCancelaVendaClick(Sender: TObject);
    procedure buttonConsultaSessaoClick(Sender: TObject);

    procedure FormActivate(Sender: TObject);

    function RetornaXML(tipoXml: string) : string;
    procedure edtCodeAtivacaoTyping(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure FuncoesTesteSAT(funcao: string; codigoAtivacao: string);    
    procedure CancelarVenda(codigoAtivacao: string; chave: string);
    procedure ConsultaSessao(codigoAtivacao: string; numeroSessao: Integer);
  end;

var
  frmTesteSat: TfrmTesteSat;
  satLib : TSatFunctions;
  retorno : TRetornoSAt;
  RetornoSAT: string;
  codigoAtivacao :  string;

implementation

{$R *.fmx}
//FUN��O QUE LER E RETORNA O ARQUIVO XML - VENDA E CANCELAMENTO
function TfrmTesteSat.RetornaXML(tipoXml: string) : string;
var
  Arq: TextFile;
  Linha, VendaXML, NomeArqVendas: string;
begin
  try
    NomeArqVendas:=  TPath.GetDocumentsPath + PathDelim + tipoXml;

    if FileExists(NomeArqVendas)then begin
      AssignFile(Arq,NomeArqVendas);
      VendaXML:='';
      reset(Arq);
      
      while not eof(Arq) do begin
        Readln(Arq,Linha);
        VendaXML := VendaXML + Linha;
      end;

      CloseFile(Arq);

      RetornaXML := VendaXML;

    end else begin
      ShowMessage('Nao existe Arquivo de Vendas:'+NomeArqVendas);
      RetornaXML := '';
    end;
  except on e: exception do

  end;
end;

//FUN��ES DE TESTE QUE POSSUEM APENAS O CODIGO ATIVACAO COMO PAR�METRO
procedure TfrmTesteSat.FuncoesTesteSAT(funcao: string; codigoAtivacao: string);
var VendaXML: string;
begin
  if (ValidaCodigoAtivacao(codigoAtivacao) or (funcao = 'consultaSAT')) then begin
  
    if (funcao = 'consultaSAT') then begin
      retornoSAT := satLib.ConsultarSAT(
          Utils.GerarNumeroSessao
        );

      retorno := InvocarOperacaoSat(TIPO_CONSULTAR_SAT, RetornoSAT);
      FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));
      
    end else if (funcao = 'StatusOperacional') then begin
      retornoSAT := satLib.ConsultarStatusOperacional(
        Utils.GerarNumeroSessao,
        codigoAtivacao
      );

      retorno := InvocarOperacaoSat(TIPO_CONSULTAR_STATUS_OPERACIONAL, RetornoSAT);
      FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));
    end else if (funcao = 'TesteFimAFim') then begin
      VendaXML :=  RetornaXML('arq_venda.xml');
  
      RetornoSAT := satLib.TesteFimAFim(
          Utils.GerarNumeroSessao,
          codigoAtivacao,
          VendaXML
        );

      retorno := InvocarOperacaoSat(TIPO_TESTE_FIM_A_FIM, RetornoSAT);
      FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));

    end else if (funcao = 'EnviarDadosVenda') then begin
      VendaXML :=  RetornaXML('arq_venda.xml');
  
      RetornoSAT := satLib.EnviarDadosVenda(
          Utils.GerarNumeroSessao,
          codigoAtivacao,
          VendaXML
        );

      retorno := InvocarOperacaoSat(TIPO_ENVIAR_DADOS_VENDA, RetornoSAT);
      Utils.CodigoCancelamento := retorno.GetChaveConsulta;
      FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));

    end;

  end else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

//FUN��ES DE TESTE QUE POSSUEM O CODIGO ATIVACAO E OUTRO PAR�METRO
procedure TfrmTesteSat.CancelarVenda(codigoAtivacao: string; chave: string);
var VendaXML: string;
begin
  if(ValidaCodigoAtivacao(codigoAtivacao)) then begin

    VendaXML :=  RetornaXML('arq_cancelamento.xml');

     VendaXML := StringReplace(VendaXML, 'trocarCfe', chave, [rfReplaceAll]);

    RetornoSAT := satLib.CancelarUltimaVenda(
        Utils.GerarNumeroSessao,
        codigoAtivacao,
        chave,
        VendaXML
      );

    retorno := InvocarOperacaoSat(TIPO_CANCELAR_ULTIMA_VENDA, RetornoSAT);
    FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));
  end else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

procedure TfrmTesteSat.ConsultaSessao(codigoAtivacao: string; numeroSessao: Integer);
begin
    if (ValidaCodigoAtivacao(codigoAtivacao)) then begin

      retornoSAT := satLib.ConsultarNumeroSessao(
        Utils.GerarNumeroSessao,
        codigoAtivacao,
        numeroSessao
      );

      retorno := InvocarOperacaoSat(TIPO_CONSULTAR_NUMERO_SESSAO, RetornoSAT);
      FrmResposta.AdicionarLinha(FormataRetornoSat(retorno));
    end else
      ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

procedure TfrmTesteSat.edtCodeAtivacaoTyping(Sender: TObject);
begin
    Utils.CodigoAtivacao := edtCodeAtivacao.Text;
end;

//FUN��ES CRIADAS PELO CLICK DOS BUTTONS
procedure TfrmTesteSat.buttonConsultaSatClick(Sender: TObject);
begin
  codigoAtivacao := edtCodeAtivacao.Text;
  FuncoesTesteSAT('consultaSAT', codigoAtivacao);
end;

procedure TfrmTesteSat.buttonStatusOperacionalClick(Sender: TObject);
begin
  codigoAtivacao := edtCodeAtivacao.Text;
  FuncoesTesteSAT('StatusOperacional', codigoAtivacao);
end;

procedure TfrmTesteSat.buttonFiaAFimClick(Sender: TObject);
begin
  codigoAtivacao := edtCodeAtivacao.Text;
  FuncoesTesteSAT('TesteFimAFim', codigoAtivacao);
end;

procedure TfrmTesteSat.buttonDadosVendaClick(Sender: TObject);
begin
  codigoAtivacao := edtCodeAtivacao.Text;
  FuncoesTesteSAT('EnviarDadosVenda', codigoAtivacao);
end;

procedure TfrmTesteSat.buttonCancelaVendaClick(Sender: TObject);
var chave : string;
begin
  codigoAtivacao := edtCodeAtivacao.Text;
  InputQuery('CANCELAR VENDA','Digite a chave de cancelamento', Utils.CodigoCancelamento,
    procedure (const md: TModalResult; const chave: string)
    begin
        if md <> mrOK then
          exit;

        try
          if chave <> '' then begin
            CancelarVenda(codigoAtivacao, chave);
          end;
        finally

         end;
    end);
end;

procedure TfrmTesteSat.buttonConsultaSessaoClick(Sender: TObject);
var numeroString : string;
    numeroInteiro : Integer;
begin
  codigoAtivacao := edtCodeAtivacao.Text;
    InputQuery('CONSULTAR SESSÃO','Digite o número da sessão', IntToStr(Utils.CodigoSessao),
      procedure (const md: TModalResult; const numeroString: string)
      begin
          if md <> mrOK then
            exit;

          try
            if numeroString <> '' then begin
              numeroInteiro := StrToInt(numeroString);

              ConsultaSessao(codigoAtivacao, numeroInteiro);
            end;
          finally

           end;
      end);
end;

procedure TfrmTesteSat.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   edtCodeAtivacao.Text := Utils.CodigoAtivacao;

end;

end.
