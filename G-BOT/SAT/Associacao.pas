unit Associacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,

  //SAT
  SatFunctions,Utils, uFormat,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FrameResposta;

type
  TfrmAssociacao = class(TForm)
    buttonAssociar: TButton;
    edtCnpjContribuinte: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCnpjSoftHouse: TEdit;
    edtCodeAtivacao: TEdit;
    edtAssinatura: TEdit;
    Layout1: TLayout;
    procedure buttonAssociarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure inputCNPJTyping(Sender: TObject);
    procedure inputCNPJSHTyping(Sender: TObject);
    procedure edtCodeAtivacaoTyping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssociarSAT(cnpjContribuinte, cnpjSofwareHouse, codigoAtivacao, assinatura: string);
  end;

var
  frmAssociacao: TfrmAssociacao;
  satLib : TSatFunctions;
  retorno : TRetornoSAt;
  RetornoSAT,
  cnpjContribuinte,
  cnpjSofwareHouse,
  codigoAtivacao,
  assinatura: string;

implementation

{$R *.fmx}
//FUNÇÃO QUE ENVIAR DADOS AO SAT
procedure TfrmAssociacao.AssociarSAT(cnpjContribuinte, cnpjSofwareHouse, codigoAtivacao, assinatura: string);
var cnpjValue,
    cnpjContribuinteLimpo,
    cnpjSofwareHouseLimpo: string;
begin
  cnpjContribuinteLimpo := SomenteNumero(cnpjContribuinte);
  cnpjSofwareHouseLimpo := SomenteNumero(cnpjSofwareHouse);

  if (ValidaCodigoAtivacao(codigoAtivacao)) then
    begin
      if assinatura.Length <> 0 then
         begin
            cnpjValue :=  cnpjSofwareHouseLimpo + '' +  cnpjContribuinteLimpo;
            RetornoSAT := satLib.AssociarAssinatura(
                Utils.GerarNumeroSessao,
                codigoAtivacao,
                cnpjValue,
                assinatura
              );

            retorno := InvocarOperacaoSat(TIPO_ASSOCIAR_ASSINATURA, RetornoSAT);
            ShowMessage(FormataRetornoSat(retorno));
         end
      else
        ShowMessage('O Código de Ativação e a Confirmação do Código de Ativação não correspondem!');
    end
  else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!')
end;

//FUNÇÃO DE CLICK DO BOTÃO ASSOCIAÇÃO
procedure TfrmAssociacao.buttonAssociarClick(Sender: TObject);
begin
  cnpjContribuinte := edtCnpjContribuinte.Text;
  cnpjSofwareHouse := edtCnpjSoftHouse.Text;
  codigoAtivacao :=  edtCodeAtivacao.Text;
  assinatura :=  edtAssinatura.Text;

  AssociarSAT(cnpjContribuinte, cnpjSofwareHouse, codigoAtivacao, assinatura);
end;

procedure TfrmAssociacao.edtCodeAtivacaoTyping(Sender: TObject);
begin
      Utils.CodigoAtivacao := edtCodeAtivacao.Text;
end;

procedure TfrmAssociacao.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   edtCnpjContribuinte.Text := '03.654.119/0001-76';
   edtCnpjSoftHouse.Text := '16.716.114/0001-72';
   edtAssinatura.Text := 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT';
   edtCodeAtivacao.Text := Utils.CodigoAtivacao;

end;

procedure TfrmAssociacao.inputCNPJSHTyping(Sender: TObject);
begin
  Formatar(edtCnpjSoftHouse, TFormato.CNPJ);
end;

procedure TfrmAssociacao.inputCNPJTyping(Sender: TObject);
begin
  Formatar(edtCnpjContribuinte, TFormato.CNPJ);
end;

end.
