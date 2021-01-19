unit LedUtil;

interface

  uses Androidapi.Jni,FMX.Dialogs;

  procedure setLed(CMD : string);


  const

  LED_RED = '0x0080';
  LED_ORANGE = '0x0180';
  LED_BLUE = '0x0200';
  LED_BLUE_PLUS_WHITE = '0x0220';
  LED_LIGHT_BLUE = '0x0270';
  LED_PINK = '0x0280';
  LED_LIGHT_PINK = '0x0380';
  LED_CYAN = '0x0300';
  LED_GREEN = '0x0100';
  LED_GREEN_PLUS_WHITE = '0x0140';
  LED_ON = '0xffff';
  LED_OFF = '0x0000';

implementation

procedure setLed(CMD : string);
var
  PEnv: PJniEnv;
  WriteSysFileManagerClass: JNIClass;
  Init, WriteSysFile : JNIMethodID;
  WriteSysFileManager: JNIObject;
begin

  // Conectado na maquina virtual do java
  PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @PEnv, nil);

  //Carrego a classe
  WriteSysFileManagerClass := PEnv^.FindClass(PEnv,'android/os/WriteSysFileManager');


  if WriteSysFileManagerClass = nil then
  begin
      ShowMessage('classe não encontrada: WriteSysFileManager');
      Exit;
  end;

  // Carrego o metodo construtor padrao
  Init:= PEnv^.GetMethodID(PEnv, WriteSysFileManagerClass, '<init>', '()V');

  // instancio a classe
  WriteSysFileManager := PEnv^.NewObject(PEnv, WriteSysFileManagerClass,Init);

  // carrego o metodo desejado
  WriteSysFile:= PEnv^.GetStaticMethodID(PEnv, WriteSysFileManagerClass, MarshaledAString(UTF8String('writeSysFile')), MarshaledAString(UTF8String('(Ljava/lang/String;Ljava/lang/String;)Z')));

  if WriteSysFileManager <> nil then
  begin
     // chamo o metodo para escrever os comandos para o LED
     PEnv^.CallStaticBooleanMethodA(PEnv,WriteSysFileManagerClass,WriteSysFile,PJNIValue(ArgsToJNIValues(
                 [StringToJNIString(PEnv, '/sys/class/leds/aw9109_led/onoff_by_reg'),StringToJNIString(PEnv, CMD)])));
  end;

end;

end.
