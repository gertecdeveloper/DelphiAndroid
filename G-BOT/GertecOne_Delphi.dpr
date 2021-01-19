program GertecOne_Delphi;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  main in 'main.pas' {frmMain},
  fala in 'fala.pas' {frmFala},
  CodigoDeBarras in 'CodigoDeBarras.pas' {frmCodigoDeBarras},
  AndroidTTS in 'AndroidTTS.pas',
  SAT in 'SAT.pas' {frmSAT},
  AlteraSenha in 'SAT\AlteraSenha.pas' {frmAlteraSenha},
  Associacao in 'SAT\Associacao.pas' {frmAssociacao},
  Ativacao in 'SAT\Ativacao.pas' {frmSatAtivacao},
  OperacaoSat in 'SAT\OperacaoSat.pas',
  OutrasFerramentas in 'SAT\OutrasFerramentas.pas' {frmOutrasFerramentas},
  Rede in 'SAT\Rede.pas' {frmRede},
  RetornoSAT in 'SAT\RetornoSAT.pas',
  SatFunctions in 'SAT\SatFunctions.pas',
  TesteSat in 'SAT\TesteSat.pas' {frmTesteSat},
  uFormat in 'SAT\uFormat.pas',
  Utils in 'SAT\Utils.pas',
  SatInterfaces in 'Imports SAT\SatInterfaces.pas',
  nfc in 'nfc.pas' {frmNFC},
  Androidapi.JNI.Nfc in 'Imports NFC\Androidapi.JNI.Nfc.pas',
  Androidapi.JNI.Nfc.Tech in 'Imports NFC\Androidapi.JNI.Nfc.Tech.pas',
  Androidapi.JNI.Toast in 'Imports NFC\Androidapi.JNI.Toast.pas',
  NFCHelper in 'Imports NFC\NFCHelper.pas',
  Kiosk in 'Kiosk.pas' {frmKiosk},
  KioskMode in 'KioskMode.pas',
  Sensor in 'Sensor.pas' {frmSensor},
  wangpos.sdk4.libbasebinder in 'wangpos.sdk4.libbasebinder.pas',
  TEF in 'TEF\TEF.pas' {frmTEF},
  FrameResposta in 'SAT\FrameResposta.pas' {FrmResposta: TFrame},
  LedUtil in 'LedUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmFala, frmFala);
  Application.CreateForm(TfrmCodigoDeBarras, frmCodigoDeBarras);
  Application.CreateForm(TfrmSAT, frmSAT);
  Application.CreateForm(TfrmAlteraSenha, frmAlteraSenha);
  Application.CreateForm(TfrmAssociacao, frmAssociacao);
  Application.CreateForm(TfrmSatAtivacao, frmSatAtivacao);
  Application.CreateForm(TfrmOutrasFerramentas, frmOutrasFerramentas);
  Application.CreateForm(TfrmRede, frmRede);
  Application.CreateForm(TfrmTesteSat, frmTesteSat);
  Application.CreateForm(TfrmNFC, frmNFC);
  Application.CreateForm(TfrmKiosk, frmKiosk);
  Application.CreateForm(TfrmSensor, frmSensor);
  Application.CreateForm(TfrmTEF, frmTEF);
  Application.Run;
end.
