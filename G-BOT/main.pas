unit main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, System.ImageList, FMX.ImgList,
  FMX.Layouts,
  //
  fala,
  kiosk,
  nfc,
  Sensor,
  CodigoDeBarras,
  TEF,
  SAT;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    LayoutLeft: TLayout;
    LayoutRight: TLayout;
    FlowLayout1: TFlowLayout;
    StyleBook1: TStyleBook;
    codigodebarras: TRectangle;
    Line2: TLine;
    btnCodigoDeBarras: TSpeedButton;
    Image2: TImage;
    Rectangle1: TRectangle;
    Line1: TLine;
    btnNFC: TSpeedButton;
    Image3: TImage;
    Rectangle2: TRectangle;
    Line3: TLine;
    btnSensor: TSpeedButton;
    Image4: TImage;
    Rectangle3: TRectangle;
    Line4: TLine;
    btnFala: TSpeedButton;
    Image5: TImage;
    Rectangle4: TRectangle;
    Line5: TLine;
    btnModoKiosk: TSpeedButton;
    Image6: TImage;
    Rectangle5: TRectangle;
    Line6: TLine;
    btnTEF: TSpeedButton;
    Image7: TImage;
    Rectangle6: TRectangle;
    Line7: TLine;
    btnSAT: TSpeedButton;
    Image8: TImage;
    procedure btnCodigoDeBarrasClick(Sender: TObject);
    procedure btnNFCClick(Sender: TObject);
    procedure btnSensorDePresencaClick(Sender: TObject);
    procedure btnFalaClick(Sender: TObject);
    procedure btnModoKioskClick(Sender: TObject);
    procedure btnTEFClick(Sender: TObject);
    procedure btnSATClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}


procedure TfrmMain.btnCodigoDeBarrasClick(Sender: TObject);
begin
  frmCodigoDeBarras.Show;
end;

procedure TfrmMain.btnFalaClick(Sender: TObject);
begin
 frmFala.Show;
end;

procedure TfrmMain.btnModoKioskClick(Sender: TObject);
begin
 frmKiosk.Show;
end;

procedure TfrmMain.btnNFCClick(Sender: TObject);
begin
  frmNFC.Show;
end;

procedure TfrmMain.btnSATClick(Sender: TObject);
begin
 frmSAT.Show;
end;

procedure TfrmMain.btnSensorDePresencaClick(Sender: TObject);
begin
  frmSensor.Show;
end;

procedure TfrmMain.btnTEFClick(Sender: TObject);
begin
  frmTEF.Show;
end;


end.
