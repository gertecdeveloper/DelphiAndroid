unit OutrasFerramentas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation,
  //SAT
  SatFunctions,Utils,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FrameResposta;

type
  TfrmOutrasFerramentas = class(TForm)
    Label1: TLabel;
    edtSenha: TEdit;
    buttonBloquearSat: TButton;
    buttonDesbloquearSat: TButton;
    buttonExtrairLog: TButton;
    buttonAtualizarSoftware: TButton;
    buttonVerificarVersao: TButton;
    Layout1: TLayout;
    procedure FormActivate(Sender: TObject);
    procedure buttonVerificarVersaoClick(Sender: TObject);
    procedure buttonAtualizarSoftwareClick(Sender: TObject);
    procedure buttonExtrairLogClick(Sender: TObject);
    procedure buttonDesbloquearSatClick(Sender: TObject);
    procedure buttonBloquearSatClick(Sender: TObject);
    procedure edtSenhaTyping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure  FuncoesFerramentas(codigoAtivacao, funcao: string);
  end;

var
  frmOutrasFerramentas: TfrmOutrasFerramentas;
  satLib : TSatFunctions;
  RetornoSAT: string;
  retorno : TRetornoSAt;
  codeAtivacao :  string;

implementation

{$R *.fmx}
//FUNÇÕES DE CHAMADAS AO SAT
procedure  TfrmOutrasFerramentas.FuncoesFerramentas(codigoAtivacao, funcao: string);
begin
    if(ValidaCodigoAtivacao(codeAtivacao)) then
        begin
           if 'BloquearSat' = funcao then begin
             retornoSAT := satLib.BloquearSAT(
              Utils.GerarNumeroSessao,
              codeAtivacao
            );

            retorno := InvocarOperacaoSat(TIPO_BLOQUEAR_SAT, RetornoSAT);
            ShowMessage(FormataRetornoSat(retorno));

           end else if 'DesbloquearSat' = funcao then begin
               retornoSAT := satLib.DesbloquearSAT(
                Utils.GerarNumeroSessao,
                codeAtivacao
              );

              retorno := InvocarOperacaoSat(TIPO_DESBLOQUEAR_SAT, RetornoSAT);
              ShowMessage(FormataRetornoSat(retorno));

           end else if 'ExtrairLog' = funcao then begin
               retornoSAT := satLib.ExtrairLogs(
                Utils.GerarNumeroSessao,
                codeAtivacao
              );

              retorno := InvocarOperacaoSat(TIPO_EXTRAIR_LOGS, RetornoSAT);
              ShowMessage(FormataRetornoSat(retorno));

           end else if 'AtualizarSoftware' = funcao then begin
               retornoSAT := satLib.AtualizarSAT(
                Utils.GerarNumeroSessao,
                codeAtivacao
              );

              retorno := InvocarOperacaoSat(TIPO_ATUALIZAR_SAT, RetornoSAT);
              ShowMessage(FormataRetornoSat(retorno));

           end else if 'VerificarVersao' = funcao then begin
               retornoSAT := satLib.Versao();

              retorno := InvocarOperacaoSat(TIPO_VERSAO, RetornoSAT);
              ShowMessage(FormataRetornoSat(retorno));
           end
        end
    else
      ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

//FUNÇÕES DE CLICK DOS BUTTONS
procedure TfrmOutrasFerramentas.buttonAtualizarSoftwareClick(Sender: TObject);
begin
  codeAtivacao :=  edtSenha.Text;
  FuncoesFerramentas(codeAtivacao, 'AtualizarSoftware');
end;

procedure TfrmOutrasFerramentas.buttonBloquearSatClick(Sender: TObject);
begin
  codeAtivacao :=  edtSenha.Text;
  FuncoesFerramentas(codeAtivacao, 'BloquearSat');
end;

procedure TfrmOutrasFerramentas.buttonDesbloquearSatClick(Sender: TObject);
begin
  codeAtivacao :=  edtSenha.Text;
  FuncoesFerramentas(codeAtivacao, 'DesbloquearSat');
end;

procedure TfrmOutrasFerramentas.buttonExtrairLogClick(Sender: TObject);
begin
  codeAtivacao :=  edtSenha.Text;
  FuncoesFerramentas(codeAtivacao, 'ExtrairLog');
end;

procedure TfrmOutrasFerramentas.buttonVerificarVersaoClick(Sender: TObject);
begin
  codeAtivacao :=  edtSenha.Text;
  FuncoesFerramentas(codeAtivacao, 'VerificarVersao');
end;

procedure TfrmOutrasFerramentas.edtSenhaTyping(Sender: TObject);
begin
     Utils.CodigoAtivacao := edtSenha.Text;
end;

procedure TfrmOutrasFerramentas.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   edtSenha.Text := Utils.CodigoAtivacao;
end;

end.
