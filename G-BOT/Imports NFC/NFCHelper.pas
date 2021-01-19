unit NFCHelper;

interface

uses
  Androidapi.JNI.Nfc,
  Androidapi.JNI.Nfc.Tech,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,

  FMX.Platform.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.Jni,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Toast,

  FMX.Platform,
  System.Messaging,
  System.SysUtils,
  System.Types,
  FMX.Types,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Edit,
  FMX.ScrollBox,
  FMX.Memo,
  System.Diagnostics,
  System.TimeSpan

  //

  ;

type

NFC_MODOS = (NFC_NONE, NFC_LEITURA, NFC_ESCRITA, NFC_ESCRITA_LEITURA, NFC_FORMATA);
NFC_RESPONSE = (NFC_OK, NFC_FAIL);

TCallBack = reference to procedure(status: NFC_RESPONSE; Retorno: string);
TReadCallBack = reference to procedure(status: NFC_RESPONSE; Retorno: string; MensagemCartao: string = '');

TNFCHelper = class

  private
    var
      lReadId : Boolean;
      lReadMensagens : Boolean;
      lReadUrlCard : Boolean;
      lGravarMensagem : Boolean;
      lGravarUrl : Boolean;
      lFormat : Boolean; //

      ModoNFC: NFC_MODOS;

      AppEvents: IFMXApplicationEventService;
      NfcAdapter: JNfcAdapter;
      PendingIntent: JPendingIntent;

      RespostaCallBack : TCallBack;
      RespostaLeituraCallBack : TReadCallBack;
      NFCMensagem: string;

    procedure OnNewNfcIntent(Intent: JIntent);

    // Proxy for calling NfcAdapter.enableForegroundDispatch
    procedure EnableForegroundDispatch;
    function ApplicationEventHandler(AAppEvent: TApplicationEvent;
                                     AContext: TObject): Boolean;

    procedure HandleIntentMessage(const Sender: TObject; const M: TMessage);

    // Formata cartão
    procedure Formatar(const Tag: JTag);

    // Grava uma Mensagem de texto no cartão
    procedure Gravar(const Tag: JTag);

    // Faz a leitura da mensagem gravada no Cartão
    procedure Ler(const Tag: JTag);

    procedure GravarLer(const Tag: JTag);

  public

    constructor Create;

    procedure LerCartao(resposta: TReadCallBack);
    procedure TesteLeituraGravacao(resposta: TReadCallBack);
    procedure GravarMesagem(Mensagem : string;resposta: TCallBack);
    procedure FormatarNFC(resposta: TCallBack);
    function JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;

end;


implementation

uses
  System.StrUtils,
  System.Permissions,
  FMX.DialogService;

constructor TNFCHelper.Create;
var
    ClassIntent: JIntent;
begin

  // Configurar o evento que é acionado quando o aplicativo é trazido de volta ao primeiro plano
  if TPlatformServices.Current.SupportsPlatformService(
       IFMXApplicationEventService,
       IInterface(AppEvents)) then
  begin
    AppEvents.SetApplicationEventHandler(ApplicationEventHandler);
  end;

  // Assinar a mensagem FMX enviada quando onNewIntent é chamado
  // com uma intenção contendo qualquer uma dessas três ações intencionais.
  // Suporte para isso foi adicionado no Delphi 10 Seattle.
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedNotification, HandleIntentMessage);
  NfcAdapter := TJNfcAdapter.JavaClass.getDefaultAdapter(TAndroidHelper.Context);
  if NfcAdapter = nil then
  begin

    // Poderia fazer com a saída daqui talvez
    raise Exception.Create('No NFC adapter present');
  end;

  // Configurar a intenção pendente necessária para habilitar o despacho de primeiro plano NFC
  ClassIntent := TJIntent.JavaClass.init(TAndroidHelper.Context, TAndroidHelper.Activity.getClass);
  PendingIntent := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, 0,
    ClassIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_SINGLE_TOP), 0);

  RespostaCallBack := nil;

end;


{$REGION 'JNI substitute for calling NfcAdapter.enableForegroundDispatch'}
procedure TNFCHelper.EnableForegroundDispatch;
var
  PEnv: PJniEnv;
  AdapterClass: JNIClass;
  NfcAdapterObject, PendingIntentObject: JNIObject;
  MethodID: JNIMethodID;
begin
  // Não podemos simplesmente chamar o método importado do NfcAdapter enableForegroundDispatch
  // porque irá falhar devido a uma falha na Ponte JNI, que não
  // suporta parâmetros de matriz 2D. Então, ao invés disso, nós o chamamos através de uma chamada JNI manual.
  PEnv := TJNIResolver.GetJNIEnv;
  NfcAdapterObject := (NfcAdapter as ILocalObject).GetObjectID;
  PendingIntentObject := (PendingIntent as ILocalObject).GetObjectID;
  AdapterClass := PEnv^.GetObjectClass(PEnv, NfcAdapterObject);
  // Obtenha a assinatura com:
  // javap -s -classpath <path_to_android_platform_jar> android.nfc.NfcAdapter
  MethodID := PEnv^.GetMethodID(
    PEnv, AdapterClass, 'enableForegroundDispatch',
    '(Landroid/app/Activity;Landroid/app/PendingIntent;' +
    '[Landroid/content/IntentFilter;[[Ljava/lang/String;)V');

  PEnv^.DeleteLocalRef(PEnv, AdapterClass);

  // Finalmente, chame o método Java de destino
  PEnv^.CallVoidMethodA(PEnv, NfcAdapterObject, MethodID,
    PJNIValue(ArgsToJNIValues([JavaContext, PendingIntentObject, nil, nil])));
end;
{$ENDREGION}

function TNFCHelper.ApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin

  case AAppEvent of
    TApplicationEvent.FinishedLaunching:
      begin
        //
      end;
    TApplicationEvent.BecameActive:
      begin
        if NfcAdapter <> nil then
        begin
          if not NfcAdapter.isEnabled then
          begin
            begin
              Toast('NFC não está ativado.' + LineFeed + 'Ativando as configurações de NFC.');
              TAndroidHelper.Activity.startActivity(
                TJIntent.JavaClass.init(StringToJString('android.settings.NFC_SETTINGS')));
            end
          end
          else
            EnableForegroundDispatch
        end;
      end;
    TApplicationEvent.WillBecomeInactive:
      begin
        if (NfcAdapter <> nil) then
          NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity);
      end;
    TApplicationEvent.WillTerminate:
      begin
        //
      end;
  end;

  Result := True;

end;

procedure TNFCHelper.HandleIntentMessage(const Sender: TObject;
  const M: TMessage);
var
  Intent: JIntent;
begin
  if M is TMessageReceivedNotification then
  begin
    Intent := TMessageReceivedNotification(M).Value;
    if Intent <> nil then
    begin
      if TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED.equals(Intent.getAction) then
      begin
        OnNewNfcIntent(Intent);
      end;
    end;
  end;
end;

procedure TNFCHelper.OnNewNfcIntent(Intent: JIntent);
var
  TagParcel: JParcelable;
  Tag : JTag;

begin

  try

    TAndroidHelper.Activity.setIntent(Intent);

    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);

    if TagParcel <> nil then
      begin

        Tag := TJTag.Wrap(TagParcel);

        case ModoNFC of
          NFC_NONE: ShowMessage('Escolha uma opção!');
          NFC_LEITURA: Ler(Tag);
          NFC_ESCRITA: Gravar(Tag);
          NFC_FORMATA: Formatar(Tag);
          NFC_ESCRITA_LEITURA: GravarLer(Tag);
        end;

      end

    else
      TDialogService.ShowMessage('Falha ao obter informações do cartão.');

  except
    on e: exception do begin
      ShowMessage('Erro=>'+e.Message);
    end;
  end;

end;


procedure TNFCHelper.Ler(const Tag: JTag);
var
  I : Integer;
  lResult : Boolean;
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  mensagem: string;
  retorno : JString;
  id: string;
begin
  ModoNFC := NFC_NONE;
  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
  begin
    try
      NDef.connect;
      lResult := NDef.isConnected;
      if lResult then
      begin

        NDefMsg := Ndef.getNdefMessage;

        if NDefMsg = nil then begin
           RespostaCallBack(NFC_FAIL,'Não foi possível ler o cartão');
           exit;
        end;

        id := 'ID Cartão: ' + JavaBytesToNumeric(Tag.getId);

        retorno := TJString.JavaClass.init(NDefMsg.getRecords[0].getPayload);

        NDef.close;

        RespostaLeituraCallBack(NFC_OK,'Cartão com Mensagem!',id + sLineBreak + JStringToString(retorno));

      end;
    except
      on EJNIException do
        RespostaLeituraCallBack(NFC_FAIL,'Não foi possível ler a mensagem.');
    end;
  end
   else begin
    id := 'ID Cartão: ' + JavaBytesToNumeric(Tag.getId);
    RespostaLeituraCallBack(NFC_FAIL,'Esta não é uma tag compatível com NDEF!',id + sLineBreak);
  end;
end;


//******************************************************************************
procedure TNFCHelper.Formatar(const Tag: JTag);
var
  I : Integer;
  lResult : Boolean;
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  mensagem: string;
  formatNDef: JNdefFormatable;
  NDefRecords: TJavaObjectArray<JNdefRecord>;

begin

  try
    ModoNFC := NFC_NONE;
    formatNDef  := TJNdefFormatable.JavaClass.get(Tag);

    if formatNDef <> nil then
    begin

      formatNDef.connect;
      lResult := formatNDef.isConnected;

      if lResult then
      begin

        NDefRecords := TJavaObjectArray<JNdefRecord>.Create(1);
        NDefRecords.Items[0] := TJNdefRecord.JavaClass.createMime(StringToJString('UTF-8'), StringToJString('GERTEC').getBytes());
        NDefMsg := TJNdefMessage.JavaClass.init(NDefRecords);
        formatNDef.format(NDefMsg);

        formatNDef.close;

        RespostaCallBack(NFC_OK,'Carto Formatado');

      end;

    end
    else
      RespostaCallBack(NFC_FAIL,'Não é necessário formatar este cartão');

  except
      on EJNIException do
        RespostaCallBack(NFC_FAIL,'Esta não é uma tag compatível com NDEF!');
    end;
end;


//******************************************************************************

procedure TNFCHelper.Gravar(const Tag: JTag);
var
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  NDefRecords: TJavaObjectArray<JNdefRecord>;
  mimeRecord : JNdefRecord;
  itens : Integer;
  lResult : Boolean;
begin
  ModoNFC := NFC_NONE;

  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
    begin
      try
        NDef.connect;
        lResult := NDef.isConnected;
        if not lResult then
           NDef.connect;

          NDefRecords := TJavaObjectArray<JNdefRecord>.Create(1);
          NDefRecords.Items[0] := TJNdefRecord.JavaClass.createMime(StringToJString('UTF-8'), StringToJString(Self.NFCMensagem).getBytes());
          NDefMsg := TJNdefMessage.JavaClass.init(NDefRecords);
          NDef.writeNdefMessage(NDefMsg);
          NDef.close;
          RespostaCallBack(NFC_OK,'Mensagem gravada com sucesso!');

      except
        on EJNIException do
         RespostaCallBack(NFC_FAIL,'Esta não é uma tag compatível com NDEF!');
      end;
    end
  else
     RespostaCallBack(NFC_FAIL,'Esta não é uma tag compatível com NDEF!');
end;


procedure TNFCHelper.GravarLer(const Tag: JTag);
var
  I : Integer;
  lResult : Boolean;
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  mensagem: string;
  retorno : JString;
  NDefRecords: TJavaObjectArray<JNdefRecord>;
  Stopwatch: TStopwatch;
  Elapsed: TTimeSpan;
  Seconds: Double;
  Resultado, id: string;
begin
  ModoNFC := NFC_NONE;
  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
  begin
    try
      NDef.connect;
      lResult := NDef.isConnected;
      if lResult then
      begin

        Stopwatch := TStopwatch.StartNew;

        NDefRecords := TJavaObjectArray<JNdefRecord>.Create(1);
        NDefRecords.Items[0] := TJNdefRecord.JavaClass.createMime(StringToJString('UTF-8'), StringToJString('GERTEC1000').getBytes());
        NDefMsg := TJNdefMessage.JavaClass.init(NDefRecords);
        NDef.writeNdefMessage(NDefMsg);

        NDefMsg := Ndef.getNdefMessage;

        if NDefMsg = nil then begin
           RespostaCallBack(NFC_FAIL,'Não foi possível ler o cartão');
           exit;
        end;

        id := 'ID Cartão: ' + JavaBytesToNumeric(Tag.getId);

        retorno := TJString.JavaClass.init(NDefMsg.getRecords[0].getPayload);

        NDef.close;

        Elapsed := Stopwatch.Elapsed;

        Resultado := 'Tempo de execução: ' + floattostr(Elapsed.TotalSeconds) + ' segundos';

        RespostaLeituraCallBack(NFC_OK,'Teste realizado com sucesso!',id + sLineBreak + 'Leitura código: ' + JStringToString(retorno)  + sLineBreak + Resultado);

      end;
    except
      on EJNIException do
        RespostaLeituraCallBack(NFC_FAIL,'Não foi possível ler a mensagem.');
    end;
  end
  else
    RespostaLeituraCallBack(NFC_FAIL,'Esta não é uma tag compatível com NDEF!');
end;


procedure TNFCHelper.LerCartao(resposta: TReadCallBack);
begin
    ModoNFC := NFC_LEITURA;
    RespostaLeituraCallBack := resposta;

end;


procedure TNFCHelper.TesteLeituraGravacao(resposta: TReadCallBack);
begin
    ModoNFC := NFC_ESCRITA_LEITURA;
    RespostaLeituraCallBack := resposta;
end;


procedure TNFCHelper.GravarMesagem(Mensagem: string; resposta: TCallBack);
begin
     ModoNFC := NFC_ESCRITA;
     RespostaCallBack := resposta;
     NFCMensagem := Mensagem;
end;

procedure TNFCHelper.FormatarNFC(resposta: TCallBack);
begin
    ModoNFC :=  NFC_FORMATA;
    RespostaCallBack := resposta;
end;

function TNFCHelper.JavaBytesToNumeric(Bytes: TJavaArray<Byte>): string;
var
  I: integer;
  soma:LongWord;
begin
  if Bytes <> nil then begin
    soma:=0;
    for I := Pred(Bytes.Length) downto 0 do
    begin
      soma := soma*256;
      soma:=soma+Bytes.Items[I];
    end;
    result:=IntToStr(soma);
  end;
end;


end.
