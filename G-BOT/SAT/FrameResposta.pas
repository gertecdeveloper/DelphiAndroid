unit FrameResposta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Utils;

type
  TFrmResposta = class(TFrame)
    meResposta: TMemo;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionarLinha(linha :string);
  end;

implementation

{$R *.fmx}

{ TFrmResposta }

procedure TFrmResposta.AdicionarLinha(linha: string);
var
espacamento : string;
begin
  espacamento := espacamento + sLineBreak;
  espacamento := espacamento + '---------------------------------------------------------------------------------------------------------';
  espacamento := espacamento + sLineBreak;
  meResposta.Lines.Insert(0,Utils.DataAtual + sLineBreak + ': ' + linha + espacamento);
end;

end.
