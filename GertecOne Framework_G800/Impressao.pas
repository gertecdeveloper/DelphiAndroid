unit Impressao;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IOUtils,
  System.Character,
  System.Generics.Collections,
  System.UIConsts,

  GEDIPrinter,    //Esta unit inicializa o Modulo de impressao para G800 e G700
  {$IFDEF __G800__}
  G800Interface,
  {$ELSE}
  G700Interface,
  {$ENDIF}

  FMX.Dialogs, FMX.Media,
  FMX.Platform, FMX.Objects, FMX.Layouts,

  FMX.Forms,
  FMX.Edit,
  FMX.Types,
  FMX.Controls,
  FMX.StdCtrls,

  Androidapi.Helpers,
  AndroidAPI.JNIBridge,
  FMX.Controls.Presentation;

type
  TfrmImpressao = class(TForm)
    cmdTesteImpressao: TButton;
    ImageControl1: TImageControl;
    Edit1: TEdit;
    procedure cmdTesteImpressaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;
  iCount:integer;

const N_COLUNAS=32;

implementation

{$R *.fmx}

//==========================================
function CentralizaTraco(strTitulo:string;NColunas:integer):string;
var
i,iLen:integer;
strAux:string;
begin
  iLen:=(NColunas - length(strTitulo))div 2;
  if(NColunas <=0)then begin
    strAux:=strTitulo;
  end else begin

    strAux:='';
    for I := 1 to iLen do
      strAux:=strAux+'=';
    strAux:=strAux+strTitulo;
    for I := 1 to NColunas - iLen -length(strTitulo)do
      strAux:=strAux+'=';
  end;
  result:=strAux;
end;
//==========================================
procedure TfrmImpressao.cmdTesteImpressaoClick(Sender: TObject);
var
i:integer;
qrCode:string;

begin

try

  //=========

  GertecPrinter.printString(CentralizaTraco('[Iniciando Impressao Imagem]',N_COLUNAS));
  GertecPrinter.printOutput;
  GertecPrinter.printImage( ImageControl1.Bitmap);
  GertecPrinter.printBlankLine(50);
  GertecPrinter.printString(CentralizaTraco('[Fim Impressao Imagem]',N_COLUNAS));
  //=========
  GertecPrinter.FlagBold := True;
  GertecPrinter.textSize := 30;
  GertecPrinter.PrintString(CENTRALIZADO,'CENTRALIZADO');

  GertecPrinter.textSize := 40;
  GertecPrinter.PrintString(ESQUERDA,'ESQUERDA');

  GertecPrinter.textSize := 20;
  GertecPrinter.PrintString(DIREITA,'DIREITA');
  GertecPrinter.Alignment := CENTRALIZADO;

  GertecPrinter.PrintString(CentralizaTraco('[Escrita Negrito ('+inttostr(iCount)+')]',N_COLUNAS));
  GertecPrinter.printBlankLine(20);

  GertecPrinter.FlagBold := False;

  GertecPrinter.FlagItalico := True;
  GertecPrinter.PrintString(CentralizaTraco('[Escrita Italico ('+inttostr(iCount)+')]',N_COLUNAS));
  GertecPrinter.FlagItalico := False;

  GertecPrinter.printBlankLine(20);

  GertecPrinter.FlagSublinhado := True;
  GertecPrinter.PrintString(CentralizaTraco('[Escrita Sublinhado ('+inttostr(iCount)+')]',N_COLUNAS));
  GertecPrinter.FlagSublinhado := False;

  GertecPrinter.printBlankLine(20);

  //=========
  GertecPrinter.FlagBold := True;
  GertecPrinter.PrintString(CentralizaTraco('[Codigo Barras CODE 128]',N_COLUNAS));
  GertecPrinter.DrawBarCode(TJGEDI_PRNTR_e_BarCodeType.JavaClass.CODE_128,120,120,'12345678901234567890');
  GertecPrinter.printBlankLine(20);
  //=========
  GertecPrinter.FlagBold := False;
  GertecPrinter.printString(CentralizaTraco('[Escrita Normal ('+inttostr(iCount)+')]',N_COLUNAS));
  GertecPrinter.printOutput;
  GertecPrinter.printString(CentralizaTraco('[BlankLine 50]',N_COLUNAS));
  GertecPrinter.printBlankLine(50);
  GertecPrinter.printString(CentralizaTraco('[Fim BlankLine 50]',N_COLUNAS));
  //=========
  GertecPrinter.printString(CentralizaTraco('[Codigo Barras EAN13]',N_COLUNAS));
  GertecPrinter.DrawBarCode(TJGEDI_PRNTR_e_BarCodeType.JavaClass.EAN_13,120,120,'7891234567895');
  //========= QRCODE
  GertecPrinter.printBlankLine(20);
  GertecPrinter.printString(CentralizaTraco('[Codigo QRCode]',N_COLUNAS));
  GertecPrinter.printBlankLine(20);
  qrCode:='';
  for i := 1 to 5 do qrCode:=qrCode+'12345678901234567890';
  GertecPrinter.DrawBarCode(TJGEDI_PRNTR_e_BarCodeType.JavaClass.QR_CODE,240,240,qrCode);
  GertecPrinter.printBlankLine(150);
  GertecPrinter.printOutput;

  inc(iCount);
except
    on e: exception do begin
      GertecPrinter.printReInit;
      ShowMessage('Erro Impressao=>'+e.Message);

  end;
end;

end;
//==========================================
procedure TfrmImpressao.FormCreate(Sender: TObject);

begin
  iCount:=0;
  {$IFDEF __G800__}
  cmdTesteImpressao.Text:='Teste Impressao - TSG800';
  {$ELSE}
  cmdTesteImpressao.Text:='Teste Impressao - GPOS700';
  {$ENDIF}

end;

end.
