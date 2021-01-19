unit KioskMode;

interface

 uses
  System.SysUtils,
  Androidapi.JNI.GraphicsContentViewText,
  FMX.Dialogs,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.JavaTypes;

 type

   TKioskMode = class

  private
    activity : JActivity;

  private
    procedure setVisibleMode(enable: boolean);
    procedure setLockTask(start : boolean);

  public
    procedure startKiosMode;
    procedure stopKiosMode;
    constructor Create;


  end;

implementation

{ TKioskMode }

constructor TKioskMode.Create;
begin
    activity := TAndroidHelper.Activity;
end;

procedure TKioskMode.setLockTask(start: boolean);
begin
   if(start) then
     activity.startLockTask()
   else
     activity.stopLockTask();
end;

procedure TKioskMode.setVisibleMode(enable: boolean);
begin
     if Enable then
    begin
       activity.getWindow.getDecorView.setSystemUiVisibility(
            TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_STABLE
            or TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
            or TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            or TJView.JavaClass.SYSTEM_UI_FLAG_HIDE_NAVIGATION
            or TJView.JavaClass.SYSTEM_UI_FLAG_FULLSCREEN or TJView.JavaClass.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
    end else begin
      activity.getWindow.getDecorView.setSystemUiVisibility(TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
    end;

end;

procedure TKioskMode.startKiosMode;
begin
   
   setLockTask(true);
   setVisibleMode(true);
end;

procedure TKioskMode.stopKiosMode;
begin
   setLockTask(false);
   setVisibleMode(false);
end;

end.
