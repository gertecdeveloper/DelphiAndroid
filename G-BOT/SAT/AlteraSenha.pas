unit AlteraSenha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListBox,
  //SAT
  SatFunctions,Utils,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,System.IOUtils,
  Androidapi.JNI.JavaTypes,
  RetornoSAT, OperacaoSat, FMX.Layouts, FrameResposta;

type
  TfrmAlteraSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    edtAtualSenha: TEdit;
    edtConfirmaSenha: TEdit;
    edtNovaSenha: TEdit;
    cbTipo: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    Layout1: TLayout;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNovaSenhaTyping(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AlterarSenha(tipo: Integer; atualCodigo, novoCodigo, confirmaNovoCodigo: string);
  end;

var
  frmAlteraSenha: TfrmAlteraSenha;
  satLib: TSatFunctions;
  retorno: TRetornoSAt;
  tipo: Integer;
  RetornoSAT,
  atualCodigo,
  novoCodigo,
  confirmaNovoCodigo: string;

implementation

{$R *.fmx}

//FUNÇÃO DE CHAMADA PARA ALTERAR A SENHA
procedure TfrmAlteraSenha.AlterarSenha(tipo: Integer; atualCodigo, novoCodigo, confirmaNovoCodigo: string);
begin
  if (ValidaCodigoAtivacao(atualCodigo) and ValidaCodigoAtivacao(novoCodigo)) then
    begin
      if novoCodigo = confirmaNovoCodigo then
         begin
            RetornoSAT := satLib.TrocarCodigoDeAtivacao(
                Utils.GerarNumeroSessao,
                atualCodigo,
                tipo,
                novoCodigo,
                confirmaNovoCodigo
              );

            retorno := InvocarOperacaoSat(TIPO_TROCAR_CODIGO_DE_ATIVACAO, RetornoSAT);
            ShowMessage(FormataRetornoSat(retorno));
         end
      else
        ShowMessage('O Código de Ativação e a Confirmação do Código de Ativação não correspondem!');
    end
  else
    ShowMessage('Código de Ativação deve ter entre 8 a 32 caracteres!');
end;

//FUNÇÃO DO BOTÃO DE ASSOCIAR
procedure TfrmAlteraSenha.Button1Click(Sender: TObject);
begin
    if cbTipo.ItemIndex = 0 then begin
        tipo := 1;
    end else if cbTipo.ItemIndex = 1 then begin
        tipo := 2;
    end;

    atualCodigo := edtAtualSenha.Text;
    novoCodigo := edtNovaSenha.Text;
    confirmaNovoCodigo := edtConfirmaSenha.Text;

    AlterarSenha(tipo, atualCodigo, novoCodigo, confirmaNovoCodigo);
end;

procedure TfrmAlteraSenha.edtNovaSenhaTyping(Sender: TObject);
begin
     Utils.CodigoAtivacao := edtNovaSenha.Text;
end;

procedure TfrmAlteraSenha.FormActivate(Sender: TObject);
begin
   satLib := TSatFunctions.Init(TAndroidHelper.Context);
   edtAtualSenha.Text := Utils.CodigoAtivacao;
end;

end.
