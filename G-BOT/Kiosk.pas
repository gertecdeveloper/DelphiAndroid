unit Kiosk;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, KioskMode;

type
  TfrmKiosk = class(TForm)
    btnKioskStart: TButton;
    btnKioskStop: TButton;
    lbKioskMode: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnKioskStartClick(Sender: TObject);
    procedure btnKioskStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKiosk: TfrmKiosk;
  kioskMode : TKioskMode;

implementation

{$R *.fmx}

procedure TfrmKiosk.btnKioskStartClick(Sender: TObject);
begin
    kioskMode.startKiosMode;
    lbKioskMode.Text := 'Modo Kiosk ativado';
end;

procedure TfrmKiosk.btnKioskStopClick(Sender: TObject);
begin
   kioskMode.stopKiosMode;
   lbKioskMode.Text := 'Modo Kiosk desativado';

end;

procedure TfrmKiosk.FormCreate(Sender: TObject);
begin
   kioskMode :=  TKioskMode.Create;
end;

end.
