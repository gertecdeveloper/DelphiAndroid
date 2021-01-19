unit Ativacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation,
  FMX.StdCtrls, uFormat,
  //SAT
  SatFunctions,Utils,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FMX.ScrollBox, FMX.Memo, FrameResposta;

type
  TfrmSatAtivacao = class(TForm)
    Label1: TLabel;
    inputCNPJ: TEdit;
    Label2: TLabel;
    inputSenha: TEdit;
    Label3: TLabel;
    inputConfimaSenha: TEdit;
    Button1: TButton;
    Layout1: TLayout;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure inputCNPJTyping(Sender: TObject);
    procedure inputSenhaTyping(Sender: TObject);
  private
    { Private declarations }
    FRetornoPipe: TStringList;
  public
    { Public declarations }
    procedure ativarSat(cnpj, codigo, codigoValida: string);
  end;

var
  frmSatAtivacao: TfrmSatAtivacao;
  satLib : TSatFunctions;
  retorno : TRetornoSAt;
  RetornoSAT,
  cnpj,
  codeAtivacao,
  confirmaCodeAtivacao: string;

implementation

{$R *.fmx}

procedure TfrmSatAtivacao.ativarSat(cnpj, codigo, codigoValida: string);
var cnpjLimpo : string;
begin
  cnpjLimpo := SomenteNumero(cnpj);

  if (ValidaCodigoAtivacao(codigo)) then
    begin
      if codigo = codigoValida then
         begin
            RetornoSAT := satLib.AtivarSAT(
                Utils.GerarNumeroSessao,
                cnpjLimpo,
                codigo
              );

            retorno := InvocarOperacaoSat(TIPO_ATIVAR_SAT, RetornoSAT);
            ShowMessage(FormataRetornoSat(retorno));
         end
      else
        ShowMessage('O Código de Ativação e a Confirmação do Código de Ativação não correspondem!');
    end
  else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

procedure TfrmSatAtivacao.Button1Click(Sender: TObject);
begin
  cnpj := inputCNPJ.Text;
  codeAtivacao := inputSenha.Text;
  confirmaCodeAtivacao := inputConfimaSenha.Text;


  ativarSat(cnpj, codeAtivacao, confirmaCodeAtivacao);
end;

procedure TfrmSatAtivacao.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   inputCNPJ.Text := '03.654.119/0001-76';
   inputSenha.Text := Utils.CodigoAtivacao;
end;

procedure TfrmSatAtivacao.inputCNPJTyping(Sender: TObject);
begin
  Formatar(inputCNPJ, TFormato.CNPJ)
end;

procedure TfrmSatAtivacao.inputSenhaTyping(Sender: TObject);
begin
    Utils.CodigoAtivacao := inputSenha.Text;
end;

end.
