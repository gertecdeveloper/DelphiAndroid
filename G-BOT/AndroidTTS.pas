unit AndroidTTS;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Speech;


type

  TAndroidTTS = class
  private type
    TInitListener = class(TJavaLocal, JTextToSpeech_OnInitListener)
    private
      [weak] FImplementation: TAndroidTTS;       public
      { JTextToSpeech_OnInitListener }
      procedure onInit(status: Integer); cdecl;
    public
      constructor Create(const AImplementation: TAndroidTTS);
    end;
  private type
    TCompletedListener = class(TJavaLocal, JTextToSpeech_OnUtteranceCompletedListener)
    private
      [weak] FImplementation: TAndroidTTS;
    public
      { JTextToSpeech_OnUtteranceCompletedListener }
      procedure onUtteranceCompleted(utteranceId: JString); cdecl;
    public
      constructor Create(const AImplementation: TAndroidTTS);
    end;
  private
    FTextToSpeech: JTextToSpeech;
    FInitListener: TInitListener;
    FCompletedListener: TCompletedListener;
    FParams: JHashMap;
    FSpeechStarted: Boolean;
  private
    procedure Initialize(const AStatus: Integer);
  public

    function Speak(const AText: String): Boolean;
    procedure Stop;
    function IsSpeaking: Boolean;

    constructor Create;
  end;

implementation

uses
  System.SysUtils,
  Androidapi.Helpers;



constructor TAndroidTTS.Create;
begin
  inherited;
  FInitListener := TInitListener.Create(Self);
  FTextToSpeech := TJTextToSpeech.JavaClass.init(TAndroidHelper.Context, FInitListener);
end;

procedure TAndroidTTS.Initialize(const AStatus: Integer);
begin
  FInitListener := nil;
  if (AStatus = TJTextToSpeech.JavaClass.SUCCESS) then
  begin


    FTextToSpeech.setLanguage(TJLocale.JavaClass.getDefault);

    { We need a hash map with a KEY_PARAM_UTTERANCE_ID parameter.
      Otherwise, onUtteranceCompleted will not get called. }
    FParams := TJHashMap.Create;
    FParams.put(TJTextToSpeech_Engine.JavaClass.KEY_PARAM_UTTERANCE_ID, StringToJString('DummyUtteranceId'));
    FCompletedListener := TCompletedListener.Create(Self);
    FTextToSpeech.setOnUtteranceCompletedListener(FCompletedListener);
  end
  else
    FTextToSpeech := nil;
end;

function TAndroidTTS.IsSpeaking: Boolean;
begin
  Result := FSpeechStarted;
end;

function TAndroidTTS.Speak(const AText: String): Boolean;
begin
  if (AText.Trim = '') then
    Exit(True);

  if Assigned(FTextToSpeech) then
  begin
    Result := (FTextToSpeech.speak(StringToJString(AText),
      TJTextToSpeech.JavaClass.QUEUE_FLUSH, FParams) = TJTextToSpeech.JavaClass.SUCCESS);
    if (Result) then
    begin
      FSpeechStarted := True;
    end;
  end
  else
    Result := False;
end;

procedure TAndroidTTS.Stop;
begin
  if Assigned(FTextToSpeech) then
    FTextToSpeech.stop;
end;



constructor TAndroidTTS.TInitListener.Create(
  const AImplementation: TAndroidTTS);
begin
  Assert(Assigned(AImplementation));
  inherited Create;
  FImplementation := AImplementation;
end;

procedure TAndroidTTS.TInitListener.onInit(status: Integer);
begin
  if Assigned(FImplementation) then
    FImplementation.Initialize(status);
end;



constructor TAndroidTTS.TCompletedListener.Create(
  const AImplementation: TAndroidTTS);
begin
  Assert(Assigned(AImplementation));
  inherited Create;
  FImplementation := AImplementation;
end;

procedure TAndroidTTS.TCompletedListener.onUtteranceCompleted(
  utteranceId: JString);
begin
  if Assigned(FImplementation) then
  begin
    FImplementation.FSpeechStarted := False;
  end;
end;


end.
