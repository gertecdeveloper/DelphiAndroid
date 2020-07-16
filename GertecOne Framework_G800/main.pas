unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Colors,
  Androidapi.Jni.Net,       //Required
  Androidapi.JNI.JavaTypes, //Required
  Androidapi.Helpers,       //Required
  Androidapi.JNI.GraphicsContentViewText, //Required
  Androidapi.JNI.App,       //Required
  System.Messaging,         //Required
  System.JSON,               //Required
  Androidapi.JNI.OS,        //Required

  //Units do projeto
  BarCode,
  Impressao,
  {$IFDEF __G800__}
  uNFC
  {$ELSE}
  G700NFC,
  uNFCid
  {$ENDIF}

  ;

type
  TfrmMain = class(TForm)
    cmdImpressao: TColorButton;
    Label1: TLabel;
    Image3: TImage;
    cmdCodigoBarras: TColorButton;
    Label2: TLabel;
    Image1: TImage;
    cmdNFC: TColorButton;
    Label3: TLabel;
    Image2: TImage;
    cmdNFCId: TColorButton;
    Label4: TLabel;
    Image4: TImage;
    ImageControl1: TImageControl;
    Label5: TLabel;
    procedure cmdCodigoBarrasClick(Sender: TObject);
    procedure cmdImpressaoClick(Sender: TObject);
    procedure cmdNFCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmdNFCIdClick(Sender: TObject);
    procedure DesligaNFC;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.cmdCodigoBarrasClick(Sender: TObject);
begin
DesligaNFC;
frmBarCode.Show;
end;

procedure TfrmMain.DesligaNFC;
begin
{$IFNDEF __G800__}
if(GertecNFC <> nil)then
  GertecNFC.PowerOff;
{$ENDIF}
end;


procedure TfrmMain.cmdImpressaoClick(Sender: TObject);
begin
//ShowMessage('Impressao');
DesligaNFC;
frmImpressao.Show;
end;

procedure TfrmMain.cmdNFCClick(Sender: TObject);
begin
//ShowMessage('NFC');
{$IFDEF __G800__}
frmNFC.Show;
{$ENDIF}
end;


procedure TfrmMain.cmdNFCIdClick(Sender: TObject);
begin
{$IFNDEF __G800__}
frmNFCid.Show;
{$ENDIF}
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
DeviceType :string;
begin
  DeviceType := JStringToString(TJBuild.JavaClass.MODEL);
  if(DeviceType ='Smart G800')then begin
    //ShowMessage('Smart G800');
    cmdNFC.Visible := True;
  end else begin//'GPOS700'
    //ShowMessage('NOT Smart G800');
    cmdNFC.Visible := false;
    cmdNFCId.Position.Y := cmdNFC.Position.Y;
  end;
  cmdNFCId.Visible := not cmdNFC.Visible;

end;

end.
