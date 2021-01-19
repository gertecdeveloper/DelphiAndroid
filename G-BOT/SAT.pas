unit SAT;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  //TELAS SAT
  Ativacao,
  Associacao,
  TesteSat,
  AlteraSenha,
  OutrasFerramentas,
  Rede, FMX.Layouts;

type
  TfrmSAT = class(TForm)
    Label1: TLabel;
    buttonAtivacao: TButton;
    buttonAssociar: TButton;
    buttonTeste: TButton;
    buttonConfiguracoes: TButton;
    buttonAlterarCodigo: TButton;
    buttonFerraamentas: TButton;
    Layout1: TLayout;

    procedure buttonAtivacaoClick(Sender: TObject);
    procedure buttonAssociarClick(Sender: TObject);
    procedure buttonTesteClick(Sender: TObject);
    procedure buttonConfiguracoesClick(Sender: TObject);
    procedure buttonAlterarCodigoClick(Sender: TObject);
    procedure buttonFerraamentasClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSAT: TfrmSAT;

implementation

{$R *.fmx}



procedure TfrmSAT.buttonAtivacaoClick(Sender: TObject);
begin
  frmSatAtivacao.Show;
end;

procedure TfrmSAT.buttonAssociarClick(Sender: TObject);
begin
   frmAssociacao.Show;
end;

procedure TfrmSAT.buttonTesteClick(Sender: TObject);
begin
  frmTesteSat.Show;
end;

procedure TfrmSAT.buttonConfiguracoesClick(Sender: TObject);
begin
  frmRede.Show;
end;

procedure TfrmSAT.buttonAlterarCodigoClick(Sender: TObject);
begin
  frmAlteraSenha.Show;
end;

procedure TfrmSAT.buttonFerraamentasClick(Sender: TObject);
begin
  frmOutrasFerramentas.Show;
end;

end.
