unit Sensor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmSensor = class(TForm)
    Label1: TLabel;
    btnIniciarServico: TButton;
    btnPararServico: TButton;
    meResposta: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnIniciarServicoClick(Sender: TObject);
    procedure btnPararServicoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSensor: TfrmSensor;
  sensorStart : Boolean;

implementation

{$R *.fmx}

procedure TfrmSensor.btnIniciarServicoClick(Sender: TObject);
begin
    sensorStart := True;
end;

procedure TfrmSensor.btnPararServicoClick(Sender: TObject);
begin
   sensorStart := False;
end;

procedure TfrmSensor.FormActivate(Sender: TObject);
begin
   sensorStart := False;
   meResposta.Lines.Clear;
end;

procedure TfrmSensor.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin

   case Key of
     // quando detecta movimento o sensor emite a tecla KEY_F4
     VKF4:
     begin
       if sensorStart = True then
       begin
         meResposta.Lines.Insert(0, TimeToStr(Now) + ' - Pessoa identificada à frente do equipamento.');
        end;
     end;

   end;

end;

end.
