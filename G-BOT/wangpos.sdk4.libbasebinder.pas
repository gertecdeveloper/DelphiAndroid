
unit wangpos.sdk4.libbasebinder;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JIBaseService = interface;//wangpos.sdk4.base.IBaseService
  JIBaseService_Stub = interface;//wangpos.sdk4.base.IBaseService$Stub
  JIBaseService_Stub_Proxy = interface;//wangpos.sdk4.base.IBaseService$Stub$Proxy
  JIBinderPool = interface;//wangpos.sdk4.base.IBinderPool
  JIBinderPool_Stub = interface;//wangpos.sdk4.base.IBinderPool$Stub
  JIBinderPool_Stub_Proxy = interface;//wangpos.sdk4.base.IBinderPool$Stub$Proxy
  JICallbackListener = interface;//wangpos.sdk4.base.ICallbackListener
  JICallbackListener_Stub = interface;//wangpos.sdk4.base.ICallbackListener$Stub
  JICallbackListener_Stub_Proxy = interface;//wangpos.sdk4.base.ICallbackListener$Stub$Proxy
  JICommonCallback = interface;//wangpos.sdk4.base.ICommonCallback
  JICommonCallback_Stub = interface;//wangpos.sdk4.base.ICommonCallback$Stub
  JICommonCallback_Stub_Proxy = interface;//wangpos.sdk4.base.ICommonCallback$Stub$Proxy
  JIDecodeCallback = interface;//wangpos.sdk4.base.IDecodeCallback
  JIDecodeCallback_Stub = interface;//wangpos.sdk4.base.IDecodeCallback$Stub
  JIDecodeCallback_Stub_Proxy = interface;//wangpos.sdk4.base.IDecodeCallback$Stub$Proxy
  JIWifiProbeListener = interface;//wangpos.sdk4.base.IWifiProbeListener
  JIWifiProbeListener_Stub = interface;//wangpos.sdk4.base.IWifiProbeListener$Stub
  JIWifiProbeListener_Stub_Proxy = interface;//wangpos.sdk4.base.IWifiProbeListener$Stub$Proxy
  JBaseBinder = interface;//wangpos.sdk4.libbasebinder.BaseBinder
  JBankCard = interface;//wangpos.sdk4.libbasebinder.BankCard
  JBaseBinder_1 = interface;//wangpos.sdk4.libbasebinder.BaseBinder$1
  JBaseBinder_2 = interface;//wangpos.sdk4.libbasebinder.BaseBinder$2
  JBaseServiceManager = interface;//wangpos.sdk4.libbasebinder.BaseServiceManager
  JBaseServiceManager_BaseServiceManagerHolder = interface;//wangpos.sdk4.libbasebinder.BaseServiceManager$BaseServiceManagerHolder
  Jlibbasebinder_BuildConfig = interface;//wangpos.sdk4.libbasebinder.BuildConfig
  JCore = interface;//wangpos.sdk4.libbasebinder.Core
  JCore_1 = interface;//wangpos.sdk4.libbasebinder.Core$1
  JCore_2 = interface;//wangpos.sdk4.libbasebinder.Core$2
  JDock = interface;//wangpos.sdk4.libbasebinder.Dock
  Jlibbasebinder_HEX = interface;//wangpos.sdk4.libbasebinder.HEX
  JIDCard = interface;//wangpos.sdk4.libbasebinder.IDCard
  Jlibbasebinder_Printer = interface;//wangpos.sdk4.libbasebinder.Printer
  JPrinter_Align = interface;//wangpos.sdk4.libbasebinder.Printer$Align
  JPrinter_BarcodeType = interface;//wangpos.sdk4.libbasebinder.Printer$BarcodeType
  JPrinter_BarcodeWidth = interface;//wangpos.sdk4.libbasebinder.Printer$BarcodeWidth
  JPrinter_Font = interface;//wangpos.sdk4.libbasebinder.Printer$Font
  JRspCode = interface;//wangpos.sdk4.libbasebinder.RspCode
  JScaner = interface;//wangpos.sdk4.libbasebinder.Scaner
  JSpeechUtil = interface;//wangpos.sdk4.libbasebinder.SpeechUtil
  JUpdatesp = interface;//wangpos.sdk4.libbasebinder.Updatesp
  JWifiCollection = interface;//wangpos.sdk4.libbasebinder.WifiCollection
  JWifiProbe = interface;//wangpos.sdk4.libbasebinder.WifiProbe
  JGeneratePinPrepareDataParameters = interface;//wangpos.sdk4.libbasebinder.entity.GeneratePinPrepareDataParameters

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;//Deprecated
    {class} procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    {class} procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    {class} procedure cancel; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getListeners: JArrayList; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure pause; cdecl;
    {class} procedure removeAllListeners; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} procedure start; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    function clone: JAnimator; cdecl;
    procedure &end; cdecl;
    function getDuration: Int64; cdecl;
    function getStartDelay: Int64; cdecl;
    function isPaused: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure resume; cdecl;
    procedure setTarget(target: JObject); cdecl;//Deprecated
    procedure setupEndValues; cdecl;//Deprecated
    procedure setupStartValues; cdecl;//Deprecated
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationPause(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationResume(animation: JAnimator); cdecl;
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;//Deprecated
    {class} function clone: JKeyframe; cdecl;
    {class} function getFraction: Single; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} procedure setFraction(fraction: Single); cdecl;//Deprecated
    {class} procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function getType: Jlang_Class; cdecl;//Deprecated
    function getValue: JObject; cdecl;//Deprecated
    function hasValue: Boolean; cdecl;//Deprecated
    procedure setValue(value: JObject); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;//Deprecated
    {class} procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;
    {class} procedure enableTransitionType(transitionType: Integer); cdecl;
    {class} function getStagger(transitionType: Integer): Int64; cdecl;
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;
    {class} function isChangingLayout: Boolean; cdecl;
    {class} function isRunning: Boolean; cdecl;
    {class} function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    {class} procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;//Deprecated
    {class} procedure setDuration(duration: Int64); cdecl; overload;//Deprecated
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;//Deprecated
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;
    function getAnimator(transitionType: Integer): JAnimator; cdecl;
    function getDuration(transitionType: Integer): Int64; cdecl;
    function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    function getTransitionListeners: JList; cdecl;
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;//Deprecated
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;//Deprecated
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;
    {class} procedure setPropertyName(propertyName: JString); cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;//Deprecated
    function getPropertyName: JString; cdecl;//Deprecated
    function toString: JString; cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;//Deprecated
    {class} procedure jumpToCurrentState; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
    function clone: JStateListAnimator; cdecl;//Deprecated
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;//Deprecated
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;//Deprecated
    {class} procedure &end; cdecl;//Deprecated
    {class} function getAnimatedFraction: Single; cdecl;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} procedure resume; cdecl;
    {class} procedure reverse; cdecl;
    {class} procedure setCurrentFraction(fraction: Single); cdecl;
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setRepeatMode(value: Integer); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure cancel; cdecl;//Deprecated
    function clone: JValueAnimator; cdecl;//Deprecated
    function getAnimatedValue: JObject; cdecl; overload;//Deprecated
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;//Deprecated
    function getCurrentPlayTime: Int64; cdecl;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getRepeatCount: Integer; cdecl;//Deprecated
    function getRepeatMode: Integer; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;
    procedure removeAllUpdateListeners; cdecl;
    procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    procedure setCurrentPlayTime(playTime: Int64); cdecl;
    function setDuration(duration: Int64): JValueAnimator; cdecl;
    procedure setEvaluator(value: JTypeEvaluator); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure setRepeatCount(value: Integer); cdecl;
    procedure start; cdecl;
    function toString: JString; cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
    function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure exit; cdecl;//Deprecated
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;//Deprecated
    {class} function getSceneRoot: JViewGroup; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    procedure enter; cdecl;//Deprecated
    procedure setEnterAction(action: JRunnable); cdecl;//Deprecated
    procedure setExitAction(action: JRunnable); cdecl;//Deprecated
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;//Deprecated
    {class} function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    {class} function addTarget(targetId: Integer): JTransition; cdecl; overload;
    {class} function canRemoveViews: Boolean; cdecl;
    {class} procedure captureEndValues(transitionValues: JTransitionValues); cdecl;
    {class} procedure captureStartValues(transitionValues: JTransitionValues); cdecl;
    {class} function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    {class} function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    {class} function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;
    {class} function getDuration: Int64; cdecl;
    {class} function getEpicenter: JRect; cdecl;
    {class} function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    {class} function getPathMotion: JPathMotion; cdecl;//Deprecated
    {class} function getPropagation: JTransitionPropagation; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getTargets: JList; cdecl;//Deprecated
    {class} function getTransitionProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
    {class} function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;//Deprecated
    {class} function removeTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    {class} function removeTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    {class} function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    {class} procedure setPathMotion(pathMotion: JPathMotion); cdecl;//Deprecated
    {class} procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;//Deprecated
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addTarget(targetName: JString): JTransition; cdecl; overload;
    function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;
    function addTarget(target: JView): JTransition; cdecl; overload;
    function clone: JTransition; cdecl;
    function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;
    function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function getTargetIds: JList; cdecl;//Deprecated
    function getTargetNames: JList; cdecl;//Deprecated
    function getTargetTypes: JList; cdecl;//Deprecated
    function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;//Deprecated
    function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    function removeTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    function setDuration(duration: Int64): JTransition; cdecl;//Deprecated
    procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;//Deprecated
    function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;//Deprecated
    function setStartDelay(startDelay: Int64): JTransition; cdecl;
    function toString: JString; cdecl;
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
    function onGetEpicenter(transition: JTransition): JRect; cdecl;
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionEnd(transition: JTransition); cdecl;
    {class} procedure onTransitionPause(transition: JTransition); cdecl;
    {class} procedure onTransitionResume(transition: JTransition); cdecl;
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionCancel(transition: JTransition); cdecl;
    procedure onTransitionStart(transition: JTransition); cdecl;
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;//Deprecated
    {class} procedure go(scene: JScene); cdecl; overload;//Deprecated
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure transitionTo(scene: JScene); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;//Deprecated
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;//Deprecated
    {class} function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    procedure captureValues(transitionValues: JTransitionValues); cdecl;
    function getPropagationProperties: TJavaObjectArray<JString>; cdecl;
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function _Getview: JView; cdecl;
    {class} function init: JTransitionValues; cdecl;//Deprecated
    {class} function equals(other: JObject): Boolean; cdecl;
    {class} property view: JView read _Getview;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getvalues: JMap; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    property values: JMap read _Getvalues;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JIBaseServiceClass = interface(JIInterfaceClass)
    ['{2E872F29-36C9-4203-83B9-4AD8C43E3401}']
    {class} function BTPrintESCPOS(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function CLGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function CardActivation(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function CollectionWIFIInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_Auth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    {class} function DesFire_Comfirm_Cancel(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatApp(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatLine_CycleFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatValueFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_DelFile(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_GetCardInfo(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ISO7816(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ReadFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_SelApp(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ValueFileOpr(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_WriteFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    {class} function EmvLib_GetPrintStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function Felica_Open(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function Felica_Transmit(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function GetAtVersion: JString; cdecl;
    {class} function GetSPLog(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl;
    {class} function Get_ClearPrinterMileage(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function Get_KeySign(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;
    {class} function L1_Contactless_wupa: Integer; cdecl;
    {class} function Logic_I2C(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    {class} function Logic_ModifyPW(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function Logic_ReadPWDegree(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function M0CardKeyAuth(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function M0GetSignData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function MifareULCAuthenticate(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function NFCTagReadBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function NFCTagWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function ReadLogicCardData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function SDK_Printer_Test: Integer; cdecl;
    {class} function SDK_ReadData(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function SDK_SendData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function ScrdGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function SerailDebugPort(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function SetCollectionCycleTime(P1: Integer): Integer; cdecl;
    {class} function SetGrayLevel(P1: Integer): Integer; cdecl;
    {class} function SetKernel(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function StopCollection: Integer; cdecl;
    {class} function VerifyLogicCardPwd(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function WriteLogicCardData(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function blueToothPrintControl(P1: Integer; P2: JICommonCallback): Integer; cdecl;
    {class} function breakOffCommand: Integer; cdecl;
    {class} function buzzer: Integer; cdecl;
    {class} function buzzerEx(P1: Integer): Integer; cdecl;
    {class} function buzzerEx2(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function buzzerFrequencyEx(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function cardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function checkSpeechServiceInstall: Integer; cdecl;
    {class} function clearPrintDataCache: Integer; cdecl;
    {class} function clearTamperStatus: Integer; cdecl;
    {class} function dataEnDecrypt(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptDeviceEx(P1: Byte; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptEx(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptExIndex(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptForIPEK(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function enableTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function genereateRandomNum(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function getBatteryLevel(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function getCardSNFunction(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function getDeviceStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDevicesVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDevicesVersionSTM(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getFirmWareNumber: JString; cdecl;
    {class} function getGMStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMac(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacEx(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacExIndex(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacForIPEK(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacWithAlgorithm(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getPrinterStatus(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function getSCVersion: JString; cdecl;
    {class} function getSDKVersion: JString; cdecl;
    {class} function getScanModuleVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getSpID(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getStatus: TJavaObjectArray<JString>; cdecl;
    {class} function getSystemSn: JString; cdecl;
    {class} function getTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function iDCardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function iccDetect: Integer; cdecl;
    {class} function icsLotPower(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function idcDetect: Integer; cdecl;
    {class} function led(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function ledFlash(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    {class} function m1CardKeyAuth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardKeyAuthAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: Integer; P9: Integer; P10: TJavaArray<Integer>; P11: TJavaArray<Byte>; P12: TJavaArray<Integer>; P13: TJavaArray<Byte>; P14: TJavaArray<Integer>; P15: TJavaArray<Byte>): Integer; cdecl;
    {class} function m1CardReadBlockData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardValueOperation(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardValueOperationAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardWriteAndReadBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardWriteBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function mini_decodeClose: Integer; cdecl;
    {class} function mini_decodeInit(P1: JIDecodeCallback): Integer; cdecl;
    {class} function mini_decodeSetLightsMode(P1: Integer): Integer; cdecl;
    {class} function mini_decodeSetMaxMultiReadCount(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartContinuousScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartMultiScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartSingleScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStopScan: Integer; cdecl;
    {class} function openCloseCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function openCloseIDCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function piccDetect: Integer; cdecl;
    {class} function piccGetCardSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function pictureSend(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function pinPadRotation: Integer; cdecl;
    {class} function print2StringInLine(P1: JString; P2: JString; P3: Single; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    {class} function printBarCode(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl;
    {class} function printBarCodeBase(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printFinish: Integer; cdecl;
    {class} function printImage(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function printImageBase(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printInit: Integer; cdecl;
    {class} function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    {class} function printPDF417WithSpace(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printPaper(P1: Integer): Integer; cdecl;
    {class} function printPaper_trade(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function printPhoto(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printQRCode(P1: JString): Integer; cdecl;
    {class} function printQRCodeByWH(P1: JString; P2: JString; P3: Integer; P4: Integer): Integer; cdecl;
    {class} function printString(P1: JString; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Integer; cdecl;
    {class} function printStringBase(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    {class} function printStringExt(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Integer; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl;
    {class} function printStringWithScaleX(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Integer; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl;
    {class} procedure printString_TypeFace(P1: TJavaArray<Byte>); cdecl;
    {class} function printerControl(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    {class} function readCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readCardIndex(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl;
    {class} function readCardms(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readContactlessInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function readIDCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function scanSingle(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function sendAPDU(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function sendCustomerSystemFlag(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function setDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} procedure setPackageName(P1: JString); cdecl;
    {class} function speech(P1: JString; P2: JICommonCallback): Integer; cdecl;
    {class} function speechInit(P1: JMap): Integer; cdecl;
    {class} function speechStop: Integer; cdecl;
    {class} function startPinInput(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    {class} function startPinInputForIPEK(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    {class} function status(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function test: Integer; cdecl;
    {class} function transmitPSAM(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function updateResult(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function updateStart(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function updatesp(P1: JString): Integer; cdecl;
    {class} function version(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function wifiProbeClose: Integer; cdecl;
    {class} function wifiProbeGetVersion: JString; cdecl;
    {class} function wifiProbeOpen: Integer; cdecl;
    {class} function wifiProbeSetRate(P1: Integer): Integer; cdecl;
    {class} function wifiProbeStartSearch(P1: JIWifiProbeListener): Integer; cdecl;
    {class} function wifiProbeStopSearch: Integer; cdecl;
    {class} function writeCallBackData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function writeCallBackDataWithCommandID(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;
    {class} function writeSN(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IBaseService')]
  JIBaseService = interface(JIInterface)
    ['{13632FF0-BCD6-4D57-A286-89EA15262F23}']
  end;
  TJIBaseService = class(TJavaGenericImport<JIBaseServiceClass, JIBaseService>) end;

  JIBaseService_StubClass = interface(JBinderClass)
    ['{029C29D3-DFA1-4718-BF9D-D1027FDE108E}']
    {class} function _GetTRANSACTION_BTPrintESCPOS: Integer; cdecl;
    {class} function _GetTRANSACTION_CLGetVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_CardActivation: Integer; cdecl;
    {class} function _GetTRANSACTION_CollectionWIFIInfo: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_Auth: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_Comfirm_Cancel: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_CreatApp: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_CreatFile: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_CreatLine_CycleFile: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_CreatValueFile: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_DelFile: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_GetCardInfo: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_ISO7816: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_ReadFile: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_SelApp: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_ValueFileOpr: Integer; cdecl;
    {class} function _GetTRANSACTION_DesFire_WriteFile: Integer; cdecl;
    {class} function _GetTRANSACTION_EmvLib_GetPrintStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_Felica_Open: Integer; cdecl;
    {class} function _GetTRANSACTION_Felica_Transmit: Integer; cdecl;
    {class} function _GetTRANSACTION_GetAtVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_GetSPLog: Integer; cdecl;
    {class} function _GetTRANSACTION_Get_ClearPrinterMileage: Integer; cdecl;
    {class} function _GetTRANSACTION_Get_KeySign: Integer; cdecl;
    {class} function _GetTRANSACTION_L1_Contactless_wupa: Integer; cdecl;
    {class} function _GetTRANSACTION_Logic_I2C: Integer; cdecl;
    {class} function _GetTRANSACTION_Logic_ModifyPW: Integer; cdecl;
    {class} function _GetTRANSACTION_Logic_ReadPWDegree: Integer; cdecl;
    {class} function _GetTRANSACTION_M0CardKeyAuth: Integer; cdecl;
    {class} function _GetTRANSACTION_M0GetSignData: Integer; cdecl;
    {class} function _GetTRANSACTION_MifareULCAuthenticate: Integer; cdecl;
    {class} function _GetTRANSACTION_NFCTagReadBlock: Integer; cdecl;
    {class} function _GetTRANSACTION_NFCTagWriteBlock: Integer; cdecl;
    {class} function _GetTRANSACTION_ReadLogicCardData: Integer; cdecl;
    {class} function _GetTRANSACTION_SDK_Printer_Test: Integer; cdecl;
    {class} function _GetTRANSACTION_SDK_ReadData: Integer; cdecl;
    {class} function _GetTRANSACTION_SDK_SendData: Integer; cdecl;
    {class} function _GetTRANSACTION_ScrdGetVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_SerailDebugPort: Integer; cdecl;
    {class} function _GetTRANSACTION_SetCollectionCycleTime: Integer; cdecl;
    {class} function _GetTRANSACTION_SetGrayLevel: Integer; cdecl;
    {class} function _GetTRANSACTION_SetKernel: Integer; cdecl;
    {class} function _GetTRANSACTION_StopCollection: Integer; cdecl;
    {class} function _GetTRANSACTION_VerifyLogicCardPwd: Integer; cdecl;
    {class} function _GetTRANSACTION_WriteLogicCardData: Integer; cdecl;
    {class} function _GetTRANSACTION_blueToothPrintControl: Integer; cdecl;
    {class} function _GetTRANSACTION_breakOffCommand: Integer; cdecl;
    {class} function _GetTRANSACTION_buzzer: Integer; cdecl;
    {class} function _GetTRANSACTION_buzzerEx: Integer; cdecl;
    {class} function _GetTRANSACTION_buzzerEx2: Integer; cdecl;
    {class} function _GetTRANSACTION_buzzerFrequencyEx: Integer; cdecl;
    {class} function _GetTRANSACTION_cardReaderDetact: Integer; cdecl;
    {class} function _GetTRANSACTION_checkSpeechServiceInstall: Integer; cdecl;
    {class} function _GetTRANSACTION_clearPrintDataCache: Integer; cdecl;
    {class} function _GetTRANSACTION_clearTamperStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_dataEnDecrypt: Integer; cdecl;
    {class} function _GetTRANSACTION_dataEnDecryptDeviceEx: Integer; cdecl;
    {class} function _GetTRANSACTION_dataEnDecryptEx: Integer; cdecl;
    {class} function _GetTRANSACTION_dataEnDecryptExIndex: Integer; cdecl;
    {class} function _GetTRANSACTION_dataEnDecryptForIPEK: Integer; cdecl;
    {class} function _GetTRANSACTION_enableTamper: Integer; cdecl;
    {class} function _GetTRANSACTION_genereateRandomNum: Integer; cdecl;
    {class} function _GetTRANSACTION_getBatteryLevel: Integer; cdecl;
    {class} function _GetTRANSACTION_getCardSNFunction: Integer; cdecl;
    {class} function _GetTRANSACTION_getDateTime: Integer; cdecl;
    {class} function _GetTRANSACTION_getDeviceStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_getDevicesVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_getDevicesVersionSTM: Integer; cdecl;
    {class} function _GetTRANSACTION_getFirmWareNumber: Integer; cdecl;
    {class} function _GetTRANSACTION_getGMStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_getMac: Integer; cdecl;
    {class} function _GetTRANSACTION_getMacEx: Integer; cdecl;
    {class} function _GetTRANSACTION_getMacExIndex: Integer; cdecl;
    {class} function _GetTRANSACTION_getMacForIPEK: Integer; cdecl;
    {class} function _GetTRANSACTION_getMacWithAlgorithm: Integer; cdecl;
    {class} function _GetTRANSACTION_getPrinterStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_getSCVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_getSDKVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_getScanModuleVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_getSpID: Integer; cdecl;
    {class} function _GetTRANSACTION_getStatus: Integer; cdecl;
    {class} function _GetTRANSACTION_getSystemSn: Integer; cdecl;
    {class} function _GetTRANSACTION_getTamper: Integer; cdecl;
    {class} function _GetTRANSACTION_iDCardReaderDetact: Integer; cdecl;
    {class} function _GetTRANSACTION_iccDetect: Integer; cdecl;
    {class} function _GetTRANSACTION_icsLotPower: Integer; cdecl;
    {class} function _GetTRANSACTION_idcDetect: Integer; cdecl;
    {class} function _GetTRANSACTION_led: Integer; cdecl;
    {class} function _GetTRANSACTION_ledFlash: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardKeyAuth: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardKeyAuthAndReadBlockData: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardReadBlockData: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardValueOperation: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardValueOperationAndReadBlockData: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardWriteAndReadBlockData: Integer; cdecl;
    {class} function _GetTRANSACTION_m1CardWriteBlockData: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeClose: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeInit: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeSetLightsMode: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeSetMaxMultiReadCount: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeStartContinuousScan: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeStartMultiScan: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeStartSingleScan: Integer; cdecl;
    {class} function _GetTRANSACTION_mini_decodeStopScan: Integer; cdecl;
    {class} function _GetTRANSACTION_openCloseCardReader: Integer; cdecl;
    {class} function _GetTRANSACTION_openCloseIDCardReader: Integer; cdecl;
    {class} function _GetTRANSACTION_piccGetCardSN: Integer; cdecl;
    {class} function _GetTRANSACTION_pictureSend: Integer; cdecl;
    {class} function _GetTRANSACTION_pinPadRotation: Integer; cdecl;
    {class} function _GetTRANSACTION_print2StringInLine: Integer; cdecl;
    {class} function _GetTRANSACTION_printBarCode: Integer; cdecl;
    {class} function _GetTRANSACTION_printBarCodeBase: Integer; cdecl;
    {class} function _GetTRANSACTION_printFinish: Integer; cdecl;
    {class} function _GetTRANSACTION_printImage: Integer; cdecl;
    {class} function _GetTRANSACTION_printImageBase: Integer; cdecl;
    {class} function _GetTRANSACTION_printInit: Integer; cdecl;
    {class} function _GetTRANSACTION_printPDF417: Integer; cdecl;
    {class} function _GetTRANSACTION_printPDF417WithSpace: Integer; cdecl;
    {class} function _GetTRANSACTION_printPaper: Integer; cdecl;
    {class} function _GetTRANSACTION_printPaper_trade: Integer; cdecl;
    {class} function _GetTRANSACTION_printPhoto: Integer; cdecl;
    {class} function _GetTRANSACTION_printQRCode: Integer; cdecl;
    {class} function _GetTRANSACTION_printQRCodeByWH: Integer; cdecl;
    {class} function _GetTRANSACTION_printString: Integer; cdecl;
    {class} function _GetTRANSACTION_printStringBase: Integer; cdecl;
    {class} function _GetTRANSACTION_printStringExt: Integer; cdecl;
    {class} function _GetTRANSACTION_printStringWithScaleX: Integer; cdecl;
    {class} function _GetTRANSACTION_printString_TypeFace: Integer; cdecl;
    {class} function _GetTRANSACTION_printerControl: Integer; cdecl;
    {class} function _GetTRANSACTION_readCard: Integer; cdecl;
    {class} function _GetTRANSACTION_readCardIndex: Integer; cdecl;
    {class} function _GetTRANSACTION_readCardms: Integer; cdecl;
    {class} function _GetTRANSACTION_readContactlessInfo: Integer; cdecl;
    {class} function _GetTRANSACTION_readIDCard: Integer; cdecl;
    {class} function _GetTRANSACTION_readSN: Integer; cdecl;
    {class} function _GetTRANSACTION_scanSingle: Integer; cdecl;
    {class} function _GetTRANSACTION_sendAPDU: Integer; cdecl;
    {class} function _GetTRANSACTION_sendCustomerSystemFlag: Integer; cdecl;
    {class} function _GetTRANSACTION_setDateTime: Integer; cdecl;
    {class} function _GetTRANSACTION_setPackageName: Integer; cdecl;
    {class} function _GetTRANSACTION_speech: Integer; cdecl;
    {class} function _GetTRANSACTION_speechInit: Integer; cdecl;
    {class} function _GetTRANSACTION_speechStop: Integer; cdecl;
    {class} function _GetTRANSACTION_startPinInput: Integer; cdecl;
    {class} function _GetTRANSACTION_startPinInputForIPEK: Integer; cdecl;
    {class} function _GetTRANSACTION_status: Integer; cdecl;
    {class} function _GetTRANSACTION_test: Integer; cdecl;
    {class} function _GetTRANSACTION_transmitPSAM: Integer; cdecl;
    {class} function _GetTRANSACTION_updateResult: Integer; cdecl;
    {class} function _GetTRANSACTION_updateStart: Integer; cdecl;
    {class} function _GetTRANSACTION_updatesp: Integer; cdecl;
    {class} function _GetTRANSACTION_version: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeClose: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeGetVersion: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeOpen: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeSetRate: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeStartSearch: Integer; cdecl;
    {class} function _GetTRANSACTION_wifiProbeStopSearch: Integer; cdecl;
    {class} function _GetTRANSACTION_writeCallBackData: Integer; cdecl;
    {class} function _GetTRANSACTION_writeCallBackDataWithCommandID: Integer; cdecl;
    {class} function _GetTRANSACTION_writeSN: Integer; cdecl;
    {class} function asInterface(P1: JIBinder): JIBaseService; cdecl;
    {class} function init: JIBaseService_Stub; cdecl;
    {class} property TRANSACTION_BTPrintESCPOS: Integer read _GetTRANSACTION_BTPrintESCPOS;
    {class} property TRANSACTION_CLGetVersion: Integer read _GetTRANSACTION_CLGetVersion;
    {class} property TRANSACTION_CardActivation: Integer read _GetTRANSACTION_CardActivation;
    {class} property TRANSACTION_CollectionWIFIInfo: Integer read _GetTRANSACTION_CollectionWIFIInfo;
    {class} property TRANSACTION_DesFire_Auth: Integer read _GetTRANSACTION_DesFire_Auth;
    {class} property TRANSACTION_DesFire_Comfirm_Cancel: Integer read _GetTRANSACTION_DesFire_Comfirm_Cancel;
    {class} property TRANSACTION_DesFire_CreatApp: Integer read _GetTRANSACTION_DesFire_CreatApp;
    {class} property TRANSACTION_DesFire_CreatFile: Integer read _GetTRANSACTION_DesFire_CreatFile;
    {class} property TRANSACTION_DesFire_CreatLine_CycleFile: Integer read _GetTRANSACTION_DesFire_CreatLine_CycleFile;
    {class} property TRANSACTION_DesFire_CreatValueFile: Integer read _GetTRANSACTION_DesFire_CreatValueFile;
    {class} property TRANSACTION_DesFire_DelFile: Integer read _GetTRANSACTION_DesFire_DelFile;
    {class} property TRANSACTION_DesFire_GetCardInfo: Integer read _GetTRANSACTION_DesFire_GetCardInfo;
    {class} property TRANSACTION_DesFire_ISO7816: Integer read _GetTRANSACTION_DesFire_ISO7816;
    {class} property TRANSACTION_DesFire_ReadFile: Integer read _GetTRANSACTION_DesFire_ReadFile;
    {class} property TRANSACTION_DesFire_SelApp: Integer read _GetTRANSACTION_DesFire_SelApp;
    {class} property TRANSACTION_DesFire_ValueFileOpr: Integer read _GetTRANSACTION_DesFire_ValueFileOpr;
    {class} property TRANSACTION_DesFire_WriteFile: Integer read _GetTRANSACTION_DesFire_WriteFile;
    {class} property TRANSACTION_EmvLib_GetPrintStatus: Integer read _GetTRANSACTION_EmvLib_GetPrintStatus;
    {class} property TRANSACTION_Felica_Open: Integer read _GetTRANSACTION_Felica_Open;
    {class} property TRANSACTION_Felica_Transmit: Integer read _GetTRANSACTION_Felica_Transmit;
    {class} property TRANSACTION_GetAtVersion: Integer read _GetTRANSACTION_GetAtVersion;
    {class} property TRANSACTION_GetSPLog: Integer read _GetTRANSACTION_GetSPLog;
    {class} property TRANSACTION_Get_ClearPrinterMileage: Integer read _GetTRANSACTION_Get_ClearPrinterMileage;
    {class} property TRANSACTION_Get_KeySign: Integer read _GetTRANSACTION_Get_KeySign;
    {class} property TRANSACTION_L1_Contactless_wupa: Integer read _GetTRANSACTION_L1_Contactless_wupa;
    {class} property TRANSACTION_Logic_I2C: Integer read _GetTRANSACTION_Logic_I2C;
    {class} property TRANSACTION_Logic_ModifyPW: Integer read _GetTRANSACTION_Logic_ModifyPW;
    {class} property TRANSACTION_Logic_ReadPWDegree: Integer read _GetTRANSACTION_Logic_ReadPWDegree;
    {class} property TRANSACTION_M0CardKeyAuth: Integer read _GetTRANSACTION_M0CardKeyAuth;
    {class} property TRANSACTION_M0GetSignData: Integer read _GetTRANSACTION_M0GetSignData;
    {class} property TRANSACTION_MifareULCAuthenticate: Integer read _GetTRANSACTION_MifareULCAuthenticate;
    {class} property TRANSACTION_NFCTagReadBlock: Integer read _GetTRANSACTION_NFCTagReadBlock;
    {class} property TRANSACTION_NFCTagWriteBlock: Integer read _GetTRANSACTION_NFCTagWriteBlock;
    {class} property TRANSACTION_ReadLogicCardData: Integer read _GetTRANSACTION_ReadLogicCardData;
    {class} property TRANSACTION_SDK_Printer_Test: Integer read _GetTRANSACTION_SDK_Printer_Test;
    {class} property TRANSACTION_SDK_ReadData: Integer read _GetTRANSACTION_SDK_ReadData;
    {class} property TRANSACTION_SDK_SendData: Integer read _GetTRANSACTION_SDK_SendData;
    {class} property TRANSACTION_ScrdGetVersion: Integer read _GetTRANSACTION_ScrdGetVersion;
    {class} property TRANSACTION_SerailDebugPort: Integer read _GetTRANSACTION_SerailDebugPort;
    {class} property TRANSACTION_SetCollectionCycleTime: Integer read _GetTRANSACTION_SetCollectionCycleTime;
    {class} property TRANSACTION_SetGrayLevel: Integer read _GetTRANSACTION_SetGrayLevel;
    {class} property TRANSACTION_SetKernel: Integer read _GetTRANSACTION_SetKernel;
    {class} property TRANSACTION_StopCollection: Integer read _GetTRANSACTION_StopCollection;
    {class} property TRANSACTION_VerifyLogicCardPwd: Integer read _GetTRANSACTION_VerifyLogicCardPwd;
    {class} property TRANSACTION_WriteLogicCardData: Integer read _GetTRANSACTION_WriteLogicCardData;
    {class} property TRANSACTION_blueToothPrintControl: Integer read _GetTRANSACTION_blueToothPrintControl;
    {class} property TRANSACTION_breakOffCommand: Integer read _GetTRANSACTION_breakOffCommand;
    {class} property TRANSACTION_buzzer: Integer read _GetTRANSACTION_buzzer;
    {class} property TRANSACTION_buzzerEx: Integer read _GetTRANSACTION_buzzerEx;
    {class} property TRANSACTION_buzzerEx2: Integer read _GetTRANSACTION_buzzerEx2;
    {class} property TRANSACTION_buzzerFrequencyEx: Integer read _GetTRANSACTION_buzzerFrequencyEx;
    {class} property TRANSACTION_cardReaderDetact: Integer read _GetTRANSACTION_cardReaderDetact;
    {class} property TRANSACTION_checkSpeechServiceInstall: Integer read _GetTRANSACTION_checkSpeechServiceInstall;
    {class} property TRANSACTION_clearPrintDataCache: Integer read _GetTRANSACTION_clearPrintDataCache;
    {class} property TRANSACTION_clearTamperStatus: Integer read _GetTRANSACTION_clearTamperStatus;
    {class} property TRANSACTION_dataEnDecrypt: Integer read _GetTRANSACTION_dataEnDecrypt;
    {class} property TRANSACTION_dataEnDecryptDeviceEx: Integer read _GetTRANSACTION_dataEnDecryptDeviceEx;
    {class} property TRANSACTION_dataEnDecryptEx: Integer read _GetTRANSACTION_dataEnDecryptEx;
    {class} property TRANSACTION_dataEnDecryptExIndex: Integer read _GetTRANSACTION_dataEnDecryptExIndex;
    {class} property TRANSACTION_dataEnDecryptForIPEK: Integer read _GetTRANSACTION_dataEnDecryptForIPEK;
    {class} property TRANSACTION_enableTamper: Integer read _GetTRANSACTION_enableTamper;
    {class} property TRANSACTION_genereateRandomNum: Integer read _GetTRANSACTION_genereateRandomNum;
    {class} property TRANSACTION_getBatteryLevel: Integer read _GetTRANSACTION_getBatteryLevel;
    {class} property TRANSACTION_getCardSNFunction: Integer read _GetTRANSACTION_getCardSNFunction;
    {class} property TRANSACTION_getDateTime: Integer read _GetTRANSACTION_getDateTime;
    {class} property TRANSACTION_getDeviceStatus: Integer read _GetTRANSACTION_getDeviceStatus;
    {class} property TRANSACTION_getDevicesVersion: Integer read _GetTRANSACTION_getDevicesVersion;
    {class} property TRANSACTION_getDevicesVersionSTM: Integer read _GetTRANSACTION_getDevicesVersionSTM;
    {class} property TRANSACTION_getFirmWareNumber: Integer read _GetTRANSACTION_getFirmWareNumber;
    {class} property TRANSACTION_getGMStatus: Integer read _GetTRANSACTION_getGMStatus;
    {class} property TRANSACTION_getMac: Integer read _GetTRANSACTION_getMac;
    {class} property TRANSACTION_getMacEx: Integer read _GetTRANSACTION_getMacEx;
    {class} property TRANSACTION_getMacExIndex: Integer read _GetTRANSACTION_getMacExIndex;
    {class} property TRANSACTION_getMacForIPEK: Integer read _GetTRANSACTION_getMacForIPEK;
    {class} property TRANSACTION_getMacWithAlgorithm: Integer read _GetTRANSACTION_getMacWithAlgorithm;
    {class} property TRANSACTION_getPrinterStatus: Integer read _GetTRANSACTION_getPrinterStatus;
    {class} property TRANSACTION_getSCVersion: Integer read _GetTRANSACTION_getSCVersion;
    {class} property TRANSACTION_getSDKVersion: Integer read _GetTRANSACTION_getSDKVersion;
    {class} property TRANSACTION_getScanModuleVersion: Integer read _GetTRANSACTION_getScanModuleVersion;
    {class} property TRANSACTION_getSpID: Integer read _GetTRANSACTION_getSpID;
    {class} property TRANSACTION_getStatus: Integer read _GetTRANSACTION_getStatus;
    {class} property TRANSACTION_getSystemSn: Integer read _GetTRANSACTION_getSystemSn;
    {class} property TRANSACTION_getTamper: Integer read _GetTRANSACTION_getTamper;
    {class} property TRANSACTION_iDCardReaderDetact: Integer read _GetTRANSACTION_iDCardReaderDetact;
    {class} property TRANSACTION_iccDetect: Integer read _GetTRANSACTION_iccDetect;
    {class} property TRANSACTION_icsLotPower: Integer read _GetTRANSACTION_icsLotPower;
    {class} property TRANSACTION_idcDetect: Integer read _GetTRANSACTION_idcDetect;
    {class} property TRANSACTION_led: Integer read _GetTRANSACTION_led;
    {class} property TRANSACTION_ledFlash: Integer read _GetTRANSACTION_ledFlash;
    {class} property TRANSACTION_m1CardKeyAuth: Integer read _GetTRANSACTION_m1CardKeyAuth;
    {class} property TRANSACTION_m1CardKeyAuthAndReadBlockData: Integer read _GetTRANSACTION_m1CardKeyAuthAndReadBlockData;
    {class} property TRANSACTION_m1CardReadBlockData: Integer read _GetTRANSACTION_m1CardReadBlockData;
    {class} property TRANSACTION_m1CardValueOperation: Integer read _GetTRANSACTION_m1CardValueOperation;
    {class} property TRANSACTION_m1CardValueOperationAndReadBlockData: Integer read _GetTRANSACTION_m1CardValueOperationAndReadBlockData;
    {class} property TRANSACTION_m1CardWriteAndReadBlockData: Integer read _GetTRANSACTION_m1CardWriteAndReadBlockData;
    {class} property TRANSACTION_m1CardWriteBlockData: Integer read _GetTRANSACTION_m1CardWriteBlockData;
    {class} property TRANSACTION_mini_decodeClose: Integer read _GetTRANSACTION_mini_decodeClose;
    {class} property TRANSACTION_mini_decodeInit: Integer read _GetTRANSACTION_mini_decodeInit;
    {class} property TRANSACTION_mini_decodeSetLightsMode: Integer read _GetTRANSACTION_mini_decodeSetLightsMode;
    {class} property TRANSACTION_mini_decodeSetMaxMultiReadCount: Integer read _GetTRANSACTION_mini_decodeSetMaxMultiReadCount;
    {class} property TRANSACTION_mini_decodeStartContinuousScan: Integer read _GetTRANSACTION_mini_decodeStartContinuousScan;
    {class} property TRANSACTION_mini_decodeStartMultiScan: Integer read _GetTRANSACTION_mini_decodeStartMultiScan;
    {class} property TRANSACTION_mini_decodeStartSingleScan: Integer read _GetTRANSACTION_mini_decodeStartSingleScan;
    {class} property TRANSACTION_mini_decodeStopScan: Integer read _GetTRANSACTION_mini_decodeStopScan;
    {class} property TRANSACTION_openCloseCardReader: Integer read _GetTRANSACTION_openCloseCardReader;
    {class} property TRANSACTION_openCloseIDCardReader: Integer read _GetTRANSACTION_openCloseIDCardReader;
    {class} property TRANSACTION_piccGetCardSN: Integer read _GetTRANSACTION_piccGetCardSN;
    {class} property TRANSACTION_pictureSend: Integer read _GetTRANSACTION_pictureSend;
    {class} property TRANSACTION_pinPadRotation: Integer read _GetTRANSACTION_pinPadRotation;
    {class} property TRANSACTION_print2StringInLine: Integer read _GetTRANSACTION_print2StringInLine;
    {class} property TRANSACTION_printBarCode: Integer read _GetTRANSACTION_printBarCode;
    {class} property TRANSACTION_printBarCodeBase: Integer read _GetTRANSACTION_printBarCodeBase;
    {class} property TRANSACTION_printFinish: Integer read _GetTRANSACTION_printFinish;
    {class} property TRANSACTION_printImage: Integer read _GetTRANSACTION_printImage;
    {class} property TRANSACTION_printImageBase: Integer read _GetTRANSACTION_printImageBase;
    {class} property TRANSACTION_printInit: Integer read _GetTRANSACTION_printInit;
    {class} property TRANSACTION_printPDF417: Integer read _GetTRANSACTION_printPDF417;
    {class} property TRANSACTION_printPDF417WithSpace: Integer read _GetTRANSACTION_printPDF417WithSpace;
    {class} property TRANSACTION_printPaper: Integer read _GetTRANSACTION_printPaper;
    {class} property TRANSACTION_printPaper_trade: Integer read _GetTRANSACTION_printPaper_trade;
    {class} property TRANSACTION_printPhoto: Integer read _GetTRANSACTION_printPhoto;
    {class} property TRANSACTION_printQRCode: Integer read _GetTRANSACTION_printQRCode;
    {class} property TRANSACTION_printQRCodeByWH: Integer read _GetTRANSACTION_printQRCodeByWH;
    {class} property TRANSACTION_printString: Integer read _GetTRANSACTION_printString;
    {class} property TRANSACTION_printStringBase: Integer read _GetTRANSACTION_printStringBase;
    {class} property TRANSACTION_printStringExt: Integer read _GetTRANSACTION_printStringExt;
    {class} property TRANSACTION_printStringWithScaleX: Integer read _GetTRANSACTION_printStringWithScaleX;
    {class} property TRANSACTION_printString_TypeFace: Integer read _GetTRANSACTION_printString_TypeFace;
    {class} property TRANSACTION_printerControl: Integer read _GetTRANSACTION_printerControl;
    {class} property TRANSACTION_readCard: Integer read _GetTRANSACTION_readCard;
    {class} property TRANSACTION_readCardIndex: Integer read _GetTRANSACTION_readCardIndex;
    {class} property TRANSACTION_readCardms: Integer read _GetTRANSACTION_readCardms;
    {class} property TRANSACTION_readContactlessInfo: Integer read _GetTRANSACTION_readContactlessInfo;
    {class} property TRANSACTION_readIDCard: Integer read _GetTRANSACTION_readIDCard;
    {class} property TRANSACTION_readSN: Integer read _GetTRANSACTION_readSN;
    {class} property TRANSACTION_scanSingle: Integer read _GetTRANSACTION_scanSingle;
    {class} property TRANSACTION_sendAPDU: Integer read _GetTRANSACTION_sendAPDU;
    {class} property TRANSACTION_sendApdu: Integer read _GetTRANSACTION_sendApdu;
    {class} property TRANSACTION_sendCustomerSystemFlag: Integer read _GetTRANSACTION_sendCustomerSystemFlag;
    {class} property TRANSACTION_setDateTime: Integer read _GetTRANSACTION_setDateTime;
    {class} property TRANSACTION_setPackageName: Integer read _GetTRANSACTION_setPackageName;
    {class} property TRANSACTION_speech: Integer read _GetTRANSACTION_speech;
    {class} property TRANSACTION_speechInit: Integer read _GetTRANSACTION_speechInit;
    {class} property TRANSACTION_speechStop: Integer read _GetTRANSACTION_speechStop;
    {class} property TRANSACTION_startPinInput: Integer read _GetTRANSACTION_startPinInput;
    {class} property TRANSACTION_startPinInputForIPEK: Integer read _GetTRANSACTION_startPinInputForIPEK;
    {class} property TRANSACTION_status: Integer read _GetTRANSACTION_status;
    {class} property TRANSACTION_test: Integer read _GetTRANSACTION_test;
    {class} property TRANSACTION_transmitPSAM: Integer read _GetTRANSACTION_transmitPSAM;
    {class} property TRANSACTION_updateResult: Integer read _GetTRANSACTION_updateResult;
    {class} property TRANSACTION_updateStart: Integer read _GetTRANSACTION_updateStart;
    {class} property TRANSACTION_updatesp: Integer read _GetTRANSACTION_updatesp;
    {class} property TRANSACTION_version: Integer read _GetTRANSACTION_version;
    {class} property TRANSACTION_wifiProbeClose: Integer read _GetTRANSACTION_wifiProbeClose;
    {class} property TRANSACTION_wifiProbeGetVersion: Integer read _GetTRANSACTION_wifiProbeGetVersion;
    {class} property TRANSACTION_wifiProbeOpen: Integer read _GetTRANSACTION_wifiProbeOpen;
    {class} property TRANSACTION_wifiProbeSetRate: Integer read _GetTRANSACTION_wifiProbeSetRate;
    {class} property TRANSACTION_wifiProbeStartSearch: Integer read _GetTRANSACTION_wifiProbeStartSearch;
    {class} property TRANSACTION_wifiProbeStopSearch: Integer read _GetTRANSACTION_wifiProbeStopSearch;
    {class} property TRANSACTION_writeCallBackData: Integer read _GetTRANSACTION_writeCallBackData;
    {class} property TRANSACTION_writeCallBackDataWithCommandID: Integer read _GetTRANSACTION_writeCallBackDataWithCommandID;
    {class} property TRANSACTION_writeSN: Integer read _GetTRANSACTION_writeSN;
  end;

  [JavaSignature('wangpos/sdk4/base/IBaseService$Stub')]
  JIBaseService_Stub = interface(JBinder)
    ['{082F56EC-59C9-4D1A-8091-C6C87DD78EBA}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJIBaseService_Stub = class(TJavaGenericImport<JIBaseService_StubClass, JIBaseService_Stub>) end;

  JIBaseService_Stub_ProxyClass = interface(JIBaseServiceClass)
    ['{7A1705F9-B3E4-4AC0-B13C-6D4BEFB68E68}']
    {class} function BTPrintESCPOS(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function CLGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function CardActivation(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function CollectionWIFIInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_Auth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    {class} function DesFire_Comfirm_Cancel(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatApp(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatLine_CycleFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_CreatValueFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_DelFile(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_GetCardInfo(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ISO7816(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ReadFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_SelApp(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_ValueFileOpr(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function DesFire_WriteFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    {class} function EmvLib_GetPrintStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function Felica_Open(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function Felica_Transmit(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function GetAtVersion: JString; cdecl;
    {class} function GetSPLog(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl;
    {class} function Get_ClearPrinterMileage(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function Get_KeySign(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;
    {class} function L1_Contactless_wupa: Integer; cdecl;
    {class} function Logic_I2C(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    {class} function Logic_ModifyPW(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function Logic_ReadPWDegree(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function M0CardKeyAuth(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function M0GetSignData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function MifareULCAuthenticate(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function NFCTagReadBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function NFCTagWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function ReadLogicCardData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function SDK_Printer_Test: Integer; cdecl;
    {class} function SDK_ReadData(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function SDK_SendData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function ScrdGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function SerailDebugPort(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function SetCollectionCycleTime(P1: Integer): Integer; cdecl;
    {class} function SetGrayLevel(P1: Integer): Integer; cdecl;
    {class} function SetKernel(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function StopCollection: Integer; cdecl;
    {class} function VerifyLogicCardPwd(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function WriteLogicCardData(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function blueToothPrintControl(P1: Integer; P2: JICommonCallback): Integer; cdecl;
    {class} function breakOffCommand: Integer; cdecl;
    {class} function buzzer: Integer; cdecl;
    {class} function buzzerEx(P1: Integer): Integer; cdecl;
    {class} function buzzerEx2(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function buzzerFrequencyEx(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function cardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function checkSpeechServiceInstall: Integer; cdecl;
    {class} function clearPrintDataCache: Integer; cdecl;
    {class} function clearTamperStatus: Integer; cdecl;
    {class} function dataEnDecrypt(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptDeviceEx(P1: Byte; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptEx(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptExIndex(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function dataEnDecryptForIPEK(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    {class} function enableTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function genereateRandomNum(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function getBatteryLevel(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function getCardSNFunction(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function getDeviceStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDevicesVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getDevicesVersionSTM(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getFirmWareNumber: JString; cdecl;
    {class} function getGMStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
    {class} function getMac(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacEx(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacExIndex(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacForIPEK(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getMacWithAlgorithm(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    {class} function getPrinterStatus(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function getSCVersion: JString; cdecl;
    {class} function getSDKVersion: JString; cdecl;
    {class} function getScanModuleVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getSpID(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function getStatus: TJavaObjectArray<JString>; cdecl;
    {class} function getSystemSn: JString; cdecl;
    {class} function getTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function iDCardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function iccDetect: Integer; cdecl;
    {class} function icsLotPower(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function idcDetect: Integer; cdecl;
    {class} function led(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function ledFlash(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    {class} function m1CardKeyAuth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardKeyAuthAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: Integer; P9: Integer; P10: TJavaArray<Integer>; P11: TJavaArray<Byte>; P12: TJavaArray<Integer>; P13: TJavaArray<Byte>; P14: TJavaArray<Integer>; P15: TJavaArray<Byte>): Integer; cdecl;
    {class} function m1CardReadBlockData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardValueOperation(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardValueOperationAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardWriteAndReadBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function m1CardWriteBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function mini_decodeClose: Integer; cdecl;
    {class} function mini_decodeInit(P1: JIDecodeCallback): Integer; cdecl;
    {class} function mini_decodeSetLightsMode(P1: Integer): Integer; cdecl;
    {class} function mini_decodeSetMaxMultiReadCount(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartContinuousScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartMultiScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStartSingleScan(P1: Integer): Integer; cdecl;
    {class} function mini_decodeStopScan: Integer; cdecl;
    {class} function openCloseCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function openCloseIDCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function piccDetect: Integer; cdecl;
    {class} function piccGetCardSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function pictureSend(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function pinPadRotation: Integer; cdecl;
    {class} function print2StringInLine(P1: JString; P2: JString; P3: Single; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    {class} function printBarCode(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl;
    {class} function printBarCodeBase(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printFinish: Integer; cdecl;
    {class} function printImage(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function printImageBase(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printInit: Integer; cdecl;
    {class} function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    {class} function printPDF417WithSpace(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printPaper(P1: Integer): Integer; cdecl;
    {class} function printPaper_trade(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function printPhoto(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function printQRCode(P1: JString): Integer; cdecl;
    {class} function printQRCodeByWH(P1: JString; P2: JString; P3: Integer; P4: Integer): Integer; cdecl;
    {class} function printString(P1: JString; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Integer; cdecl;
    {class} function printStringBase(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    {class} function printStringExt(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Integer; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl;
    {class} function printStringWithScaleX(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Integer; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl;
    {class} procedure printString_TypeFace(P1: TJavaArray<Byte>); cdecl;
    {class} function printerControl(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    {class} function readCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readCardIndex(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl;
    {class} function readCardms(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readContactlessInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function readIDCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    {class} function readSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function scanSingle(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function sendAPDU(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function sendCustomerSystemFlag(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function setDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} procedure setPackageName(P1: JString); cdecl;
    {class} function speech(P1: JString; P2: JICommonCallback): Integer; cdecl;
    {class} function speechInit(P1: JMap): Integer; cdecl;
    {class} function speechStop: Integer; cdecl;
    {class} function startPinInput(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    {class} function startPinInputForIPEK(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    {class} function status(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function test: Integer; cdecl;
    {class} function transmitPSAM(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    {class} function updateResult(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function updateStart(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function updatesp(P1: JString): Integer; cdecl;
    {class} function version(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function wifiProbeClose: Integer; cdecl;
    {class} function wifiProbeGetVersion: JString; cdecl;
    {class} function wifiProbeOpen: Integer; cdecl;
    {class} function wifiProbeSetRate(P1: Integer): Integer; cdecl;
    {class} function wifiProbeStartSearch(P1: JIWifiProbeListener): Integer; cdecl;
    {class} function wifiProbeStopSearch: Integer; cdecl;
    {class} function writeCallBackData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} function writeCallBackDataWithCommandID(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;
    {class} function writeSN(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IBaseService$Stub$Proxy')]
  JIBaseService_Stub_Proxy = interface(JIBaseService)
    ['{5D699796-C013-4CE6-AD8C-B3B579E1B422}']
  end;
  TJIBaseService_Stub_Proxy = class(TJavaGenericImport<JIBaseService_Stub_ProxyClass, JIBaseService_Stub_Proxy>) end;

  JIBinderPoolClass = interface(JIInterfaceClass)
    ['{937C7394-4E23-406E-BBF5-FACC430E568F}']
    {class} function queryBinder(P1: Integer): JIBinder; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IBinderPool')]
  JIBinderPool = interface(JIInterface)
    ['{45317028-A38E-4255-8D48-7F924F2DD9BB}']
  end;
  TJIBinderPool = class(TJavaGenericImport<JIBinderPoolClass, JIBinderPool>) end;

  JIBinderPool_StubClass = interface(JBinderClass)
    ['{67496AF5-1D57-4DD1-8860-C0C0CA537806}']
    {class} function asInterface(P1: JIBinder): JIBinderPool; cdecl;
    {class} function init: JIBinderPool_Stub; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IBinderPool$Stub')]
  JIBinderPool_Stub = interface(JBinder)
    ['{C35C9F91-265E-46F3-88CB-9191F41B9456}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJIBinderPool_Stub = class(TJavaGenericImport<JIBinderPool_StubClass, JIBinderPool_Stub>) end;

  JIBinderPool_Stub_ProxyClass = interface(JIBinderPoolClass)
    ['{4DEFB44E-CC44-4997-A526-6B8E4A552CA9}']
    {class} function asBinder: JIBinder; cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
    {class} function queryBinder(P1: Integer): JIBinder; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IBinderPool$Stub$Proxy')]
  JIBinderPool_Stub_Proxy = interface(JIBinderPool)
    ['{13811715-BA65-4AA1-B284-9B8DDDF51CB0}']
  end;
  TJIBinderPool_Stub_Proxy = class(TJavaGenericImport<JIBinderPool_Stub_ProxyClass, JIBinderPool_Stub_Proxy>) end;

  JICallbackListenerClass = interface(JIInterfaceClass)
    ['{DB33AB90-F9A0-4BB8-83D6-3BE98050A495}']
    {class} function emvCoreCallback(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICallbackListener')]
  JICallbackListener = interface(JIInterface)
    ['{51986C1D-A79C-4276-AC73-54C6E7A9668B}']
  end;
  TJICallbackListener = class(TJavaGenericImport<JICallbackListenerClass, JICallbackListener>) end;

  JICallbackListener_StubClass = interface(JBinderClass)
    ['{BDB91778-509C-4806-BAD4-F46ED282BA12}']
    {class} function asInterface(P1: JIBinder): JICallbackListener; cdecl;
    {class} function init: JICallbackListener_Stub; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICallbackListener$Stub')]
  JICallbackListener_Stub = interface(JBinder)
    ['{E862100A-2431-4154-BF2A-B59C7592A1E4}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJICallbackListener_Stub = class(TJavaGenericImport<JICallbackListener_StubClass, JICallbackListener_Stub>) end;

  JICallbackListener_Stub_ProxyClass = interface(JICallbackListenerClass)
    ['{41519BB8-12E0-4CA0-BA9E-9C727A7D67B8}']
    {class} function asBinder: JIBinder; cdecl;
    {class} function emvCoreCallback(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICallbackListener$Stub$Proxy')]
  JICallbackListener_Stub_Proxy = interface(JICallbackListener)
    ['{4342CA0A-2B8A-4203-91C0-8D1057C09512}']
  end;
  TJICallbackListener_Stub_Proxy = class(TJavaGenericImport<JICallbackListener_Stub_ProxyClass, JICallbackListener_Stub_Proxy>) end;

  JICommonCallbackClass = interface(JIInterfaceClass)
    ['{1DC67A16-708D-4D86-8D5F-7E7EF439A24E}']
    {class} function CommonCallback(P1: Integer): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICommonCallback')]
  JICommonCallback = interface(JIInterface)
    ['{F3D6335A-34DE-4CB6-BBDE-837C092000BC}']
  end;
  TJICommonCallback = class(TJavaGenericImport<JICommonCallbackClass, JICommonCallback>) end;

  JICommonCallback_StubClass = interface(JBinderClass)
    ['{FCEC3511-0221-4DB2-9A93-AE680EBCA150}']
    {class} function asInterface(P1: JIBinder): JICommonCallback; cdecl;
    {class} function init: JICommonCallback_Stub; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICommonCallback$Stub')]
  JICommonCallback_Stub = interface(JBinder)
    ['{93AFF61C-65DF-4090-BABA-47847C5F5669}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJICommonCallback_Stub = class(TJavaGenericImport<JICommonCallback_StubClass, JICommonCallback_Stub>) end;

  JICommonCallback_Stub_ProxyClass = interface(JICommonCallbackClass)
    ['{B7C6F496-D7A9-4199-BF34-CC8687100349}']
    {class} function CommonCallback(P1: Integer): Integer; cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/ICommonCallback$Stub$Proxy')]
  JICommonCallback_Stub_Proxy = interface(JICommonCallback)
    ['{D8A8D984-A066-4A2D-BD55-3D6B96596EC4}']
  end;
  TJICommonCallback_Stub_Proxy = class(TJavaGenericImport<JICommonCallback_Stub_ProxyClass, JICommonCallback_Stub_Proxy>) end;

  JIDecodeCallbackClass = interface(JIInterfaceClass)
    ['{E0B782EA-F20E-448D-81ED-0221B1C2C5BE}']
    {class} function CommonCallback(P1: Integer): Integer; cdecl;
    {class} function resultCallback(P1: Integer; P2: JString; P3: Byte; P4: Byte; P5: Byte; P6: Integer; P7: TJavaArray<Byte>): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IDecodeCallback')]
  JIDecodeCallback = interface(JIInterface)
    ['{D43C2195-3DB8-4201-8900-7B1082ECE3BC}']
  end;
  TJIDecodeCallback = class(TJavaGenericImport<JIDecodeCallbackClass, JIDecodeCallback>) end;

  JIDecodeCallback_StubClass = interface(JBinderClass)
    ['{8DB270EB-AA7B-42DF-AA55-9CAD0370029F}']
    {class} function _GetTRANSACTION_CommonCallback: Integer; cdecl;
    {class} function asInterface(P1: JIBinder): JIDecodeCallback; cdecl;
    {class} function init: JIDecodeCallback_Stub; cdecl;
    {class} property TRANSACTION_CommonCallback: Integer read _GetTRANSACTION_CommonCallback;
  end;

  [JavaSignature('wangpos/sdk4/base/IDecodeCallback$Stub')]
  JIDecodeCallback_Stub = interface(JBinder)
    ['{D3BB9231-F004-493D-9FDB-EF54CFB7E2A9}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJIDecodeCallback_Stub = class(TJavaGenericImport<JIDecodeCallback_StubClass, JIDecodeCallback_Stub>) end;

  JIDecodeCallback_Stub_ProxyClass = interface(JIDecodeCallbackClass)
    ['{267C071F-B57B-4F22-BB72-74E62810B4A7}']
    {class} function CommonCallback(P1: Integer): Integer; cdecl;
    {class} function asBinder: JIBinder; cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
    {class} function resultCallback(P1: Integer; P2: JString; P3: Byte; P4: Byte; P5: Byte; P6: Integer; P7: TJavaArray<Byte>): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IDecodeCallback$Stub$Proxy')]
  JIDecodeCallback_Stub_Proxy = interface(JIDecodeCallback)
    ['{18F59960-660C-43F3-B68C-13582344ECB9}']
  end;
  TJIDecodeCallback_Stub_Proxy = class(TJavaGenericImport<JIDecodeCallback_Stub_ProxyClass, JIDecodeCallback_Stub_Proxy>) end;

  JIWifiProbeListenerClass = interface(JIInterfaceClass)
    ['{D7B3FBD3-5C5C-4C60-B85D-A7E8A68E959F}']
    {class} procedure callBackProbeData(P1: JString); cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IWifiProbeListener')]
  JIWifiProbeListener = interface(JIInterface)
    ['{1D8EF600-D701-4ACD-BB26-DEF21F4408B3}']
  end;
  TJIWifiProbeListener = class(TJavaGenericImport<JIWifiProbeListenerClass, JIWifiProbeListener>) end;

  JIWifiProbeListener_StubClass = interface(JBinderClass)
    ['{8640E826-F22A-4BBE-80A5-63223FC62029}']
    {class} function asInterface(P1: JIBinder): JIWifiProbeListener; cdecl;
    {class} function init: JIWifiProbeListener_Stub; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IWifiProbeListener$Stub')]
  JIWifiProbeListener_Stub = interface(JBinder)
    ['{2356FC36-39B2-4528-97CA-2D30C02B99EF}']
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
  end;
  TJIWifiProbeListener_Stub = class(TJavaGenericImport<JIWifiProbeListener_StubClass, JIWifiProbeListener_Stub>) end;

  JIWifiProbeListener_Stub_ProxyClass = interface(JIWifiProbeListenerClass)
    ['{48A553B1-0A3C-4B8E-9F67-FC430D2BD3EE}']
    {class} function asBinder: JIBinder; cdecl;
    {class} procedure callBackProbeData(P1: JString); cdecl;
    {class} function getInterfaceDescriptor: JString; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/base/IWifiProbeListener$Stub$Proxy')]
  JIWifiProbeListener_Stub_Proxy = interface(JIWifiProbeListener)
    ['{FC649C88-3A87-4D6A-B436-BE60D63F2D20}']
  end;
  TJIWifiProbeListener_Stub_Proxy = class(TJavaGenericImport<JIWifiProbeListener_Stub_ProxyClass, JIWifiProbeListener_Stub_Proxy>) end;

  JBaseBinderClass = interface(JObjectClass)
    ['{58E0592E-359C-457D-8D36-A288AD3416FC}']
    {class} function _GetBINDER_NONE: Integer; cdecl;
    {class} function _GetmService: JIBaseService; cdecl;
    {class} function getInstance(P1: JContext): JBaseBinder; cdecl;
    {class} function init: JBaseBinder; cdecl;
    {class} property BINDER_NONE: Integer read _GetBINDER_NONE;
    {class} property mService: JIBaseService read _GetmService;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BaseBinder')]
  JBaseBinder = interface(JObject)
    ['{D0AC2417-5889-4A46-B2CC-037ECFB7DF13}']
    function _GetmBinderConnected: Boolean; cdecl;
    function queryBinder(P1: Integer): JIBinder; cdecl;
    property mBinderConnected: Boolean read _GetmBinderConnected;
  end;
  TJBaseBinder = class(TJavaGenericImport<JBaseBinderClass, JBaseBinder>) end;

  JBankCardClass = interface(JBaseBinderClass)
    ['{B1ECBFE2-FED5-4453-AEC9-55A172A63C89}']
    {class} function _GetCARD_DETECT_EXIST: Integer; cdecl;
    {class} function _GetCARD_DETECT_NOTEXIST: Integer; cdecl;
    {class} function _GetCARD_MODE_ICC: Integer; cdecl;
    {class} function _GetCARD_MODE_ICC_APDU: Integer; cdecl;
    {class} function _GetCARD_MODE_MAG: Integer; cdecl;
    {class} function _GetCARD_MODE_NFC: Integer; cdecl;
    {class} function _GetCARD_MODE_PICC: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM1: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM1_APDU: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM2: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM2_APDU: Integer; cdecl;
    {class} function _GetCARD_NMODE_ICC: Integer; cdecl;
    {class} function _GetCARD_NMODE_MAG: Integer; cdecl;
    {class} function _GetCARD_NMODE_PICC: Integer; cdecl;
    {class} function _GetCARD_READ_BANKCARD: Byte; cdecl;
    {class} function _GetCARD_READ_CANCELED: Byte; cdecl;
    {class} function _GetCARD_READ_CLOSE: Byte; cdecl;
    {class} function _GetCARD_READ_FAIL: Byte; cdecl;
    {class} function _GetCARD_READ_ICDETACT: Byte; cdecl;
    {class} function _GetCARD_READ_MAGENC: Byte; cdecl;
    {class} function _GetCARD_READ_MAGENCFAIL: Byte; cdecl;
    {class} function _GetCARD_READ_MANUAL: Byte; cdecl;
    {class} function _GetCARD_READ_OPEN: Byte; cdecl;
    {class} function _GetCARD_READ_PICCDETACT: Byte; cdecl;
    {class} function _GetCARD_READ_PSAM1DETACT: Byte; cdecl;
    {class} function _GetCARD_READ_PSAM2DETACT: Byte; cdecl;
    {class} function _GetCARD_READ_TIMEOUT: Byte; cdecl;
    {class} function _GetCARD_TYPE_INDUSTRY: Byte; cdecl;
    {class} function _GetCARD_TYPE_NORMAL: Byte; cdecl;
    {class} function _GetCARD_TYPE_TEST: Byte; cdecl;
    {class} function init(P1: JContext): JBankCard; cdecl;
    {class} property CARD_DETECT_EXIST: Integer read _GetCARD_DETECT_EXIST;
    {class} property CARD_DETECT_NOTEXIST: Integer read _GetCARD_DETECT_NOTEXIST;
    {class} property CARD_MODE_ICC: Integer read _GetCARD_MODE_ICC;
    {class} property CARD_MODE_ICC_APDU: Integer read _GetCARD_MODE_ICC_APDU;
    {class} property CARD_MODE_MAG: Integer read _GetCARD_MODE_MAG;
    {class} property CARD_MODE_NFC: Integer read _GetCARD_MODE_NFC;
    {class} property CARD_MODE_PICC: Integer read _GetCARD_MODE_PICC;
    {class} property CARD_MODE_PSAM1: Integer read _GetCARD_MODE_PSAM1;
    {class} property CARD_MODE_PSAM1_APDU: Integer read _GetCARD_MODE_PSAM1_APDU;
    {class} property CARD_MODE_PSAM2: Integer read _GetCARD_MODE_PSAM2;
    {class} property CARD_MODE_PSAM2_APDU: Integer read _GetCARD_MODE_PSAM2_APDU;
    {class} property CARD_NMODE_ICC: Integer read _GetCARD_NMODE_ICC;
    {class} property CARD_NMODE_MAG: Integer read _GetCARD_NMODE_MAG;
    {class} property CARD_NMODE_PICC: Integer read _GetCARD_NMODE_PICC;
    {class} property CARD_READ_BANKCARD: Byte read _GetCARD_READ_BANKCARD;
    {class} property CARD_READ_CANCELED: Byte read _GetCARD_READ_CANCELED;
    {class} property CARD_READ_CLOSE: Byte read _GetCARD_READ_CLOSE;
    {class} property CARD_READ_FAIL: Byte read _GetCARD_READ_FAIL;
    {class} property CARD_READ_ICDETACT: Byte read _GetCARD_READ_ICDETACT;
    {class} property CARD_READ_MAGENC: Byte read _GetCARD_READ_MAGENC;
    {class} property CARD_READ_MAGENCFAIL: Byte read _GetCARD_READ_MAGENCFAIL;
    {class} property CARD_READ_MANUAL: Byte read _GetCARD_READ_MANUAL;
    {class} property CARD_READ_OPEN: Byte read _GetCARD_READ_OPEN;
    {class} property CARD_READ_PICCDETACT: Byte read _GetCARD_READ_PICCDETACT;
    {class} property CARD_READ_PSAM1DETACT: Byte read _GetCARD_READ_PSAM1DETACT;
    {class} property CARD_READ_PSAM2DETACT: Byte read _GetCARD_READ_PSAM2DETACT;
    {class} property CARD_READ_TIMEOUT: Byte read _GetCARD_READ_TIMEOUT;
    {class} property CARD_TYPE_INDUSTRY: Byte read _GetCARD_TYPE_INDUSTRY;
    {class} property CARD_TYPE_NORMAL: Byte read _GetCARD_TYPE_NORMAL;
    {class} property CARD_TYPE_TEST: Byte read _GetCARD_TYPE_TEST;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BankCard')]
  JBankCard = interface(JBaseBinder)
    ['{76CC615E-7DBF-4F57-A3A3-2D434D9B0B81}']
    function CLGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function CardActivation(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_Auth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function DesFire_Comfirm_Cancel(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_CreatApp(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_CreatFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_CreatLine_CycleFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_CreatValueFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_DelFile(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_GetCardInfo(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_ISO7816(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_ReadFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_SelApp(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_ValueFileOpr(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    function DesFire_WriteFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;
    function Felica_Open(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    function Felica_Transmit(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function L1_Contactless_wupa: Integer; cdecl;
    function Logic_ModifyPW(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function Logic_ReadPWDegree(P1: TJavaArray<Byte>): Integer; cdecl;
    function M0CardKeyAuth(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function M0GetSignData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    function MifareULCAuthenticate(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function NFCTagReadBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    function NFCTagWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function ReadLogicCardData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function ScrdGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function VerifyLogicCardPwd(P1: TJavaArray<Byte>): Integer; cdecl;
    function WriteLogicCardData(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function breakOffCommand: Integer; cdecl;
    function cardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    function getCardSNFunction(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function iccDetect: Integer; cdecl;
    function icsLotPower(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    function m1CardKeyAuth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>): Integer; cdecl;
    function m1CardKeyAuthAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: Integer; P9: Integer; P10: TJavaArray<Integer>; P11: TJavaArray<Byte>; P12: TJavaArray<Integer>; P13: TJavaArray<Byte>; P14: TJavaArray<Integer>; P15: TJavaArray<Byte>): Integer; cdecl;
    function m1CardReadBlockData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;
    function m1CardValueOperation(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function m1CardValueOperationAndReadBlockData(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;
    function m1CardWriteAndReadBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    function m1CardWriteBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function openCloseCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    function parseART(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function parseMagnetic(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    function piccDetect: Integer; cdecl;
    function readCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    function readCardIndex(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl;
    function readCardms(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    function readContactlessInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function sendAPDU(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJBankCard = class(TJavaGenericImport<JBankCardClass, JBankCard>) end;

  JBaseBinder_1Class = interface(JServiceConnectionClass)
    ['{9BCC384C-34F4-42BB-8F6E-06D383A0F9AA}']
    {class} function init(P1: JBaseBinder): JBaseBinder_1; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BaseBinder$1')]
  JBaseBinder_1 = interface(JServiceConnection)
    ['{998A0AE3-E792-4C84-B250-F39EA9BC15F0}']
    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
    procedure onServiceDisconnected(P1: JComponentName); cdecl;
  end;
  TJBaseBinder_1 = class(TJavaGenericImport<JBaseBinder_1Class, JBaseBinder_1>) end;

  JBaseBinder_2Class = interface(JIBinder_DeathRecipientClass)
    ['{DE7B0208-DF16-47ED-BB64-44B579E515AE}']
    {class} function init(P1: JBaseBinder): JBaseBinder_2; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BaseBinder$2')]
  JBaseBinder_2 = interface(JIBinder_DeathRecipient)
    ['{D1B6118E-36E4-4276-B685-28273C36FF6C}']
    procedure binderDied; cdecl;
  end;
  TJBaseBinder_2 = class(TJavaGenericImport<JBaseBinder_2Class, JBaseBinder_2>) end;

  JBaseServiceManagerClass = interface(JObjectClass)
    ['{624E6547-4247-4921-9229-2ADF898254A5}']
    {class} function getInstance: Jlang_Class; cdecl;
    {class} function getService(P1: JString): JIBinder; cdecl;
    {class} function init: JBaseServiceManager; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BaseServiceManager')]
  JBaseServiceManager = interface(JObject)
    ['{207C8824-36AE-487C-A82E-5AD2D7E3BB1B}']
  end;
  TJBaseServiceManager = class(TJavaGenericImport<JBaseServiceManagerClass, JBaseServiceManager>) end;

  JBaseServiceManager_BaseServiceManagerHolderClass = interface(JObjectClass)
    ['{87973983-D7E0-44EF-8F28-63266FD8CE0D}']
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BaseServiceManager$BaseServiceManagerHolder')]
  JBaseServiceManager_BaseServiceManagerHolder = interface(JObject)
    ['{1867F704-F48C-4B35-ACAC-44036D494524}']
  end;
  TJBaseServiceManager_BaseServiceManagerHolder = class(TJavaGenericImport<JBaseServiceManager_BaseServiceManagerHolderClass, JBaseServiceManager_BaseServiceManagerHolder>) end;

  Jlibbasebinder_BuildConfigClass = interface(JObjectClass)
    ['{E8788166-54BD-4B53-AFB8-6B66D856FF3A}']
    {class} function _GetAPPLICATION_ID: JString; cdecl;
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetFLAVOR: JString; cdecl;
    {class} function _GetVERSION_CODE: Integer; cdecl;
    {class} function _GetVERSION_NAME: JString; cdecl;
    {class} function init: Jlibbasebinder_BuildConfig; cdecl;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BuildConfig')]
  Jlibbasebinder_BuildConfig = interface(JObject)
    ['{60EB4A8B-D695-43D7-9897-94C0F37443E9}']
  end;
  TJlibbasebinder_BuildConfig = class(TJavaGenericImport<Jlibbasebinder_BuildConfigClass, Jlibbasebinder_BuildConfig>) end;

  JCoreClass = interface(JBaseBinderClass)
    ['{565B07B0-E02F-45B0-8AEF-BE47BD866A51}']
    {class} function _GetALGORITHM_3DES: Integer; cdecl;
    {class} function _GetALGORITHM_AES: Integer; cdecl;
    {class} function _GetALGORITHM_DES: Integer; cdecl;
    {class} function _GetCALLBACK_ADVICE: Integer; cdecl;
    {class} function _GetCALLBACK_AMOUNT: Integer; cdecl;
    {class} function _GetCALLBACK_APPREF: Integer; cdecl;
    {class} function _GetCALLBACK_NOTIFY: Integer; cdecl;
    {class} function _GetCALLBACK_ONLINE: Integer; cdecl;
    {class} function _GetCALLBACK_PIN: Integer; cdecl;
    {class} function _GetCALLBACK_PINN: Integer; cdecl;
    {class} function _GetCALLBACK_PINRESULT: Integer; cdecl;
    {class} function _GetCALLBACK_UNKNOWNTLV: Integer; cdecl;
    {class} function _GetCALLBACK_VERIFYUSERIDCARD: Integer; cdecl;
    {class} function _GetDECRYPT_MODE: Integer; cdecl;
    {class} function _GetENCRYPT_MODE: Integer; cdecl;
    {class} function _GetENCRYPT_MODE_CBC: Integer; cdecl;
    {class} function _GetENCRYPT_MODE_ECB: Integer; cdecl;
    {class} function _GetEnDecrypt_3DES: Byte; cdecl;
    {class} function _GetEnDecrypt_AES: Byte; cdecl;
    {class} function _GetEnDecrypt_DES: Byte; cdecl;
    {class} function _GetEnDecrypt_SM4: Byte; cdecl;
    {class} function _GetGETMAC_3DES: Byte; cdecl;
    {class} function _GetGETMAC_AES: Byte; cdecl;
    {class} function _GetGETMAC_DES: Byte; cdecl;
    {class} function _GetGETMAC_SM4: Byte; cdecl;
    {class} function _GetIM_KEY_3DES: Byte; cdecl;
    {class} function _GetIM_KEY_AES: Byte; cdecl;
    {class} function _GetIM_KEY_DES: Byte; cdecl;
    {class} function _GetIM_KEY_SM4: Byte; cdecl;
    {class} function _GetKEY_PROTECT_TLK: Byte; cdecl;
    {class} function _GetKEY_PROTECT_TMK: Byte; cdecl;
    {class} function _GetKEY_PROTECT_ZERO: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DDEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DMAK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_IPEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_KBPK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_MAK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_PEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_TLK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_TMK: Byte; cdecl;
    {class} function _GetPDD_MODE_2: Integer; cdecl;
    {class} function _GetPDD_MODE_9797: Integer; cdecl;
    {class} function _GetPDD_MODE_NONE: Integer; cdecl;
    {class} function _GetPIN_CMD_PREPARE: Byte; cdecl;
    {class} function _GetPIN_CMD_QUIT: Byte; cdecl;
    {class} function _GetPIN_CMD_UPDATE: Byte; cdecl;
    {class} function _GetPIN_PREPARE_APAsswordNew: Byte; cdecl;
    {class} function _GetPIN_PREPARE_APassword: Byte; cdecl;
    {class} function _GetPIN_PREPARE_BPAssword: Byte; cdecl;
    {class} function _GetPIN_PREPARE_BPAsswordNew: Byte; cdecl;
    {class} function _GetPIN_PREPARE_OFFLINE: Byte; cdecl;
    {class} function _GetPIN_PREPARE_ONLINE: Byte; cdecl;
    {class} function _GetPIN_QUIT_BYPASS: Byte; cdecl;
    {class} function _GetPIN_QUIT_CANCEL: Byte; cdecl;
    {class} function _GetPIN_QUIT_ERROR: Byte; cdecl;
    {class} function _GetPIN_QUIT_ERRORPAN: Byte; cdecl;
    {class} function _GetPIN_QUIT_NOUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_PAINUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_PINBLOCKUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_SUCCESS: Byte; cdecl;
    {class} function _GetPIN_QUIT_TIMEOUT: Byte; cdecl;
    {class} function _GetPMK_UPADATE_KEYTYPE: Byte; cdecl;
    {class} function _GetPMK_UPDATE_KEYINDEX: Byte; cdecl;
    {class} function _GetPMK_UPDATE_KEYLEN: Byte; cdecl;
    {class} function getButtonPosition(P1: JButton; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;
    {class} function getButtonPosition_HS(P1: JButton; P2: TJavaArray<Byte>; P3: JContext; P4: Integer): Integer; cdecl;
    {class} function init(P1: JContext): JCore; cdecl;
    {class} function shortToByte(P1: SmallInt): TJavaArray<Byte>; cdecl;
    {class} property ALGORITHM_3DES: Integer read _GetALGORITHM_3DES;
    {class} property ALGORITHM_AES: Integer read _GetALGORITHM_AES;
    {class} property ALGORITHM_DES: Integer read _GetALGORITHM_DES;
    {class} property CALLBACK_ADVICE: Integer read _GetCALLBACK_ADVICE;
    {class} property CALLBACK_AMOUNT: Integer read _GetCALLBACK_AMOUNT;
    {class} property CALLBACK_APPREF: Integer read _GetCALLBACK_APPREF;
    {class} property CALLBACK_NOTIFY: Integer read _GetCALLBACK_NOTIFY;
    {class} property CALLBACK_ONLINE: Integer read _GetCALLBACK_ONLINE;
    {class} property CALLBACK_PIN: Integer read _GetCALLBACK_PIN;
    {class} property CALLBACK_PINN: Integer read _GetCALLBACK_PINN;
    {class} property CALLBACK_PINRESULT: Integer read _GetCALLBACK_PINRESULT;
    {class} property CALLBACK_UNKNOWNTLV: Integer read _GetCALLBACK_UNKNOWNTLV;
    {class} property CALLBACK_VERIFYUSERIDCARD: Integer read _GetCALLBACK_VERIFYUSERIDCARD;
    {class} property DECRYPT_MODE: Integer read _GetDECRYPT_MODE;
    {class} property ENCRYPT_MODE: Integer read _GetENCRYPT_MODE;
    {class} property ENCRYPT_MODE_CBC: Integer read _GetENCRYPT_MODE_CBC;
    {class} property ENCRYPT_MODE_ECB: Integer read _GetENCRYPT_MODE_ECB;
    {class} property EnDecrypt_3DES: Byte read _GetEnDecrypt_3DES;
    {class} property EnDecrypt_AES: Byte read _GetEnDecrypt_AES;
    {class} property EnDecrypt_DES: Byte read _GetEnDecrypt_DES;
    {class} property EnDecrypt_SM4: Byte read _GetEnDecrypt_SM4;
    {class} property GETMAC_3DES: Byte read _GetGETMAC_3DES;
    {class} property GETMAC_AES: Byte read _GetGETMAC_AES;
    {class} property GETMAC_DES: Byte read _GetGETMAC_DES;
    {class} property GETMAC_SM4: Byte read _GetGETMAC_SM4;
    {class} property IM_KEY_3DES: Byte read _GetIM_KEY_3DES;
    {class} property IM_KEY_AES: Byte read _GetIM_KEY_AES;
    {class} property IM_KEY_DES: Byte read _GetIM_KEY_DES;
    {class} property IM_KEY_SM4: Byte read _GetIM_KEY_SM4;
    {class} property KEY_PROTECT_TLK: Byte read _GetKEY_PROTECT_TLK;
    {class} property KEY_PROTECT_TMK: Byte read _GetKEY_PROTECT_TMK;
    {class} property KEY_PROTECT_ZERO: Byte read _GetKEY_PROTECT_ZERO;
    {class} property KEY_REQUEST_DDEK: Byte read _GetKEY_REQUEST_DDEK;
    {class} property KEY_REQUEST_DEK: Byte read _GetKEY_REQUEST_DEK;
    {class} property KEY_REQUEST_DMAK: Byte read _GetKEY_REQUEST_DMAK;
    {class} property KEY_REQUEST_IPEK: Byte read _GetKEY_REQUEST_IPEK;
    {class} property KEY_REQUEST_KBPK: Byte read _GetKEY_REQUEST_KBPK;
    {class} property KEY_REQUEST_MAK: Byte read _GetKEY_REQUEST_MAK;
    {class} property KEY_REQUEST_PEK: Byte read _GetKEY_REQUEST_PEK;
    {class} property KEY_REQUEST_TLK: Byte read _GetKEY_REQUEST_TLK;
    {class} property KEY_REQUEST_TMK: Byte read _GetKEY_REQUEST_TMK;
    {class} property PDD_MODE_2: Integer read _GetPDD_MODE_2;
    {class} property PDD_MODE_9797: Integer read _GetPDD_MODE_9797;
    {class} property PDD_MODE_NONE: Integer read _GetPDD_MODE_NONE;
    {class} property PIN_CMD_PREPARE: Byte read _GetPIN_CMD_PREPARE;
    {class} property PIN_CMD_QUIT: Byte read _GetPIN_CMD_QUIT;
    {class} property PIN_CMD_UPDATE: Byte read _GetPIN_CMD_UPDATE;
    {class} property PIN_PREPARE_APAsswordNew: Byte read _GetPIN_PREPARE_APAsswordNew;
    {class} property PIN_PREPARE_APassword: Byte read _GetPIN_PREPARE_APassword;
    {class} property PIN_PREPARE_BPAssword: Byte read _GetPIN_PREPARE_BPAssword;
    {class} property PIN_PREPARE_BPAsswordNew: Byte read _GetPIN_PREPARE_BPAsswordNew;
    {class} property PIN_PREPARE_OFFLINE: Byte read _GetPIN_PREPARE_OFFLINE;
    {class} property PIN_PREPARE_ONLINE: Byte read _GetPIN_PREPARE_ONLINE;
    {class} property PIN_QUIT_BYPASS: Byte read _GetPIN_QUIT_BYPASS;
    {class} property PIN_QUIT_CANCEL: Byte read _GetPIN_QUIT_CANCEL;
    {class} property PIN_QUIT_ERROR: Byte read _GetPIN_QUIT_ERROR;
    {class} property PIN_QUIT_ERRORPAN: Byte read _GetPIN_QUIT_ERRORPAN;
    {class} property PIN_QUIT_NOUPLOAD: Byte read _GetPIN_QUIT_NOUPLOAD;
    {class} property PIN_QUIT_PAINUPLOAD: Byte read _GetPIN_QUIT_PAINUPLOAD;
    {class} property PIN_QUIT_PINBLOCKUPLOAD: Byte read _GetPIN_QUIT_PINBLOCKUPLOAD;
    {class} property PIN_QUIT_SUCCESS: Byte read _GetPIN_QUIT_SUCCESS;
    {class} property PIN_QUIT_TIMEOUT: Byte read _GetPIN_QUIT_TIMEOUT;
    {class} property PMK_UPADATE_KEYTYPE: Byte read _GetPMK_UPADATE_KEYTYPE;
    {class} property PMK_UPDATE_KEYINDEX: Byte read _GetPMK_UPDATE_KEYINDEX;
    {class} property PMK_UPDATE_KEYLEN: Byte read _GetPMK_UPDATE_KEYLEN;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Core')]
  JCore = interface(JBaseBinder)
    ['{FD610F68-9BBC-4174-B810-1355EFA7310C}']
    function EmvLib_GetPrintStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function GeneratePINPrepareData(P1: JGeneratePinPrepareDataParameters): Integer; cdecl; overload;
    function GetSPLog(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl;
    function Get_KeySign(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;
    function SDK_ReadData(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function SDK_SendData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function SerailDebugPort(P1: Integer; P2: Integer): Integer; cdecl;
    function SetKernel(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    function buzzer: Integer; cdecl;
    function buzzerEx(P1: Integer): Integer; cdecl; overload;
    function buzzerEx(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function buzzerFrequencyEx(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    function checkSpeechServiceInstall: Integer; cdecl;
    function clearTamperStatus: Integer; cdecl;
    function configEMVPINSetting(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Boolean; P7: Boolean; P8: Boolean; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl;
    function dataEnDecrypt(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function dataEnDecryptEx(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    function dataEnDecryptExIndex(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    function dataEnDecryptForIPEK(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;
    function decode_Close: Integer; cdecl;
    function decode_Init(P1: JIDecodeCallback): Integer; cdecl;
    function decode_SetLightsMode(P1: Integer): Integer; cdecl;
    function decode_SetMaxMultiReadCount(P1: Integer): Integer; cdecl;
    function decode_StartContinuousScan(P1: Integer): Integer; cdecl;
    function decode_StartMultiScan(P1: Integer): Integer; cdecl;
    function decode_StartSingleScan(P1: Integer): Integer; cdecl;
    function decode_StopScan: Integer; cdecl;
    function enableTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JActivity): Integer; cdecl; overload;
    function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: Integer): Integer; cdecl; overload;
    function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: JActivity): Integer; cdecl; overload;
    function generatePINPrepareData_HS(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: JContext; P17: Integer): Integer; cdecl;
    function genereateRandomNum(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function getBatteryLevel(P1: TJavaArray<Byte>): Integer; cdecl;
    function getDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    function getDeviceEncryptData(P1: JString; P2: JString): JString; cdecl;
    function getDeviceStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function getDevicesVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function getDevicesVersionSTM(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function getFirmWareNumber: JString; cdecl;
    function getGMStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function getMac(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
    function getMacEx(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;
    function getMacExIndex(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    function getMacForIPEK(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    function getMacWithAlgorithm(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;
    function getSCVersion: JString; cdecl;
    function getSDKVersion: JString; cdecl;
    function getSpID(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function getSystemSn: JString; cdecl;
    function getTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function led(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function ledFlash(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    function pinPadRotation: Integer; cdecl;
    function readDeviceSN: JString; cdecl;
    function readSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function setDateTime(P1: TJavaArray<Byte>): Integer; cdecl;
    function speech(P1: JString; P2: JICommonCallback): Integer; cdecl;
    function speechInit(P1: JMap): Integer; cdecl;
    function speechStop: Integer; cdecl;
    function startPinInput(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    function startPinInputForIPEK(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: JICallbackListener): Integer; cdecl;
    function transmitPSAM(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    function writeCallBackData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function writeCallBackDataWithCommandID(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;
    function writeSN(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
  end;
  TJCore = class(TJavaGenericImport<JCoreClass, JCore>) end;

  JCore_1Class = interface(JICallbackListener_StubClass)
    ['{D3775239-FDE5-42B3-AC3B-CFE051D37701}']
    {class} function init(P1: JCore): JCore_1; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Core$1')]
  JCore_1 = interface(JICallbackListener_Stub)
    ['{E90C7EBF-E344-4C2B-9BF8-BA3FA6E2A8D4}']
    function emvCoreCallback(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJCore_1 = class(TJavaGenericImport<JCore_1Class, JCore_1>) end;

  JCore_2Class = interface(JICallbackListener_StubClass)
    ['{F21ACB7A-4810-4AC5-9981-4812C4A76F19}']
    {class} function init(P1: JCore): JCore_2; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Core$2')]
  JCore_2 = interface(JICallbackListener_Stub)
    ['{64FBEFD8-4004-4869-BC7D-B45BAD440CC7}']
    function emvCoreCallback(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJCore_2 = class(TJavaGenericImport<JCore_2Class, JCore_2>) end;

  JDockClass = interface(JBaseBinderClass)
    ['{7D5A32F4-F911-414D-8976-7D30EB27DBA1}']
    {class} function _GetINIT: Integer; cdecl;
    {class} function init(P1: JContext): JDock; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Dock')]
  JDock = interface(JBaseBinder)
    ['{61A44963-ED10-4C37-8DFB-411B3AEE5AD5}']
    function pictureSend(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function status(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function test: Integer; cdecl;
    function updateResult(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function updateStart(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function version(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJDock = class(TJavaGenericImport<JDockClass, JDock>) end;

  Jlibbasebinder_HEXClass = interface(JObjectClass)
    ['{1FCC49BA-F9B8-4153-BD78-A74C257891C3}']
    {class} function bytesToCppHex(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl;
    {class} function bytesToHex(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytesToHex(P1: TJavaArray<Byte>; P2: Char): JString; cdecl; overload;
    {class} function bytesToHex(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
    {class} function bytesToHex(P1: TJavaArray<Byte>; P2: Char; P3: Integer): JString; cdecl; overload;
    {class} function bytesToHex(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function hexToBytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function init: Jlibbasebinder_HEX; cdecl;
    {class} function toBeHex(P1: Integer; P2: Integer): JString; cdecl;
    {class} function toLeHex(P1: Integer; P2: Integer): JString; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/HEX')]
  Jlibbasebinder_HEX = interface(JObject)
    ['{5D5563F8-1962-4EE2-82EA-DD658533BD33}']
  end;
  TJlibbasebinder_HEX = class(TJavaGenericImport<Jlibbasebinder_HEXClass, Jlibbasebinder_HEX>) end;

  JIDCardClass = interface(JBaseBinderClass)
    ['{470118F6-07E3-4F06-9C4F-2B4FE16277CA}']
    {class} function _GetCARD_MODE_IDCARD: Integer; cdecl;
    {class} function _GetCARD_MODE_PICC: Integer; cdecl;
    {class} function _GetCARD_OPER_OFF: Integer; cdecl;
    {class} function _GetCARD_OPER_ON: Integer; cdecl;
    {class} function _GetCARD_TYPE_IC: Integer; cdecl;
    {class} function _GetCARD_TYPE_PICC: Integer; cdecl;
    {class} function init(P1: JContext): JIDCard; cdecl;
    {class} property CARD_MODE_IDCARD: Integer read _GetCARD_MODE_IDCARD;
    {class} property CARD_MODE_PICC: Integer read _GetCARD_MODE_PICC;
    {class} property CARD_OPER_OFF: Integer read _GetCARD_OPER_OFF;
    {class} property CARD_OPER_ON: Integer read _GetCARD_OPER_ON;
    {class} property CARD_TYPE_IC: Integer read _GetCARD_TYPE_IC;
    {class} property CARD_TYPE_PICC: Integer read _GetCARD_TYPE_PICC;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/IDCard')]
  JIDCard = interface(JBaseBinder)
    ['{A850189A-0C4C-4BF0-B0EF-4A141A990484}']
    function iDCardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    function icsLotPower(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
    function idcDetect: Integer; cdecl;
    function openCloseIDCardReader(P1: Integer; P2: Integer): Integer; cdecl;
    function piccGetCardSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    function readCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;
    function sendApdu(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJIDCard = class(TJavaGenericImport<JIDCardClass, JIDCard>) end;

  Jlibbasebinder_PrinterClass = interface(JBaseBinderClass)
    ['{D1AE50FE-0981-415C-95BB-2146190B21F2}']
    {class} function _GetPAPER_WIDTH: Integer; cdecl;
    {class} function init(P1: JContext): Jlibbasebinder_Printer; cdecl;
    {class} property PAPER_WIDTH: Integer read _GetPAPER_WIDTH;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer')]
  Jlibbasebinder_Printer = interface(JBaseBinder)
    ['{6D794F15-D0FB-425F-9563-24F518B75ECE}']
    procedure CheckBlueToothPrintStatus; cdecl;
    procedure CheckUSBPrintStatus; cdecl;
    function Get_ClearPrinterMileage(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function SDK_Printer_Test: Integer; cdecl;
    function clearPrintDataCache: Integer; cdecl;
    procedure enableCustomFont(P1: Boolean); cdecl;
    function escposBlueToothPrint(P1: TJavaArray<Byte>): Integer; cdecl;
    function finishBlueToothPrint: Integer; cdecl;
    function finishUSBPrint: Integer; cdecl;
    function getPrinterStatus(P1: TJavaArray<Integer>): Integer; cdecl;
    function initBlueToothPrint(P1: JICommonCallback): Integer; cdecl;
    function initUSBPrint(P1: JICommonCallback): Integer; cdecl;
    function print2StringInLine(P1: JString; P2: JString; P3: Single; P4: JPrinter_Font; P5: Integer; P6: JPrinter_Align; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    function printBarCode(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl;
    function printBarCodeBase(P1: JString; P2: JPrinter_BarcodeType; P3: JPrinter_BarcodeWidth; P4: Integer; P5: Integer): Integer; cdecl;
    function printFinish: Integer; cdecl;
    function printImage(P1: JBitmap; P2: Integer; P3: JPrinter_Align): Integer; cdecl;
    function printImageBase(P1: JBitmap; P2: Integer; P3: Integer; P4: JPrinter_Align; P5: Integer): Integer; cdecl;
    function printInit: Integer; cdecl;
    function printPDF417(P1: JString): Integer; cdecl; overload;
    function printPDF417(P1: JString; P2: Integer): Integer; cdecl; overload;
    function printPDF417(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: JPrinter_Align): Integer; cdecl; overload;
    function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: JPrinter_Align; P5: Integer): Integer; cdecl; overload;
    function printPaper(P1: Integer): Integer; cdecl;
    function printPaper_trade(P1: Integer; P2: Integer): Integer; cdecl;
    function printPhoto(P1: JBitmap; P2: Integer; P3: Integer; P4: JPrinter_Align; P5: Integer): Integer; cdecl;
    function printQRCode(P1: JString): Integer; cdecl; overload;
    function printQRCode(P1: JString; P2: Integer): Integer; cdecl; overload;
    function printQRCode(P1: JString; P2: Integer; P3: JPrinter_Align): Integer; cdecl; overload;
    function printString(P1: JString; P2: Integer; P3: JPrinter_Align; P4: Boolean; P5: Boolean): Integer; cdecl; overload;
    function printString(P1: JString; P2: JPrinter_Font; P3: Integer; P4: JPrinter_Align; P5: Boolean; P6: Boolean; P7: Boolean): Integer; cdecl; overload;
    function printString(P1: JString; P2: JPrinter_Font; P3: Integer; P4: JPrinter_Align; P5: Boolean; P6: Boolean; P7: Boolean; P8: Boolean): Integer; cdecl; overload;
    function printStringBase(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: JPrinter_Align; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;
    function printStringExt(P1: JString; P2: Integer; P3: Single; P4: Single; P5: JPrinter_Font; P6: Integer; P7: JPrinter_Align; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl;
    function printStringWithScaleX(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: JPrinter_Font; P7: Integer; P8: JPrinter_Align; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl;
    function setGrayLevel(P1: Integer): Integer; cdecl;
    procedure setPrintFontType(P1: JContext; P2: JString); cdecl;
    function startBlueToothPrint: Integer; cdecl;
    function startUSBPrint: Integer; cdecl;
  end;
  TJlibbasebinder_Printer = class(TJavaGenericImport<Jlibbasebinder_PrinterClass, Jlibbasebinder_Printer>) end;

  JPrinter_AlignClass = interface(JEnumClass)
    ['{6C94E26E-3874-46DE-988A-0EF0312847A8}']
    {class} function _GetCENTER: JPrinter_Align; cdecl;
    {class} function _GetLEFT: JPrinter_Align; cdecl;
    {class} function _GetRIGHT: JPrinter_Align; cdecl;
    {class} function valueOf(P1: JString): JPrinter_Align; cdecl;
    {class} function values: TJavaObjectArray<JPrinter_Align>; cdecl;
    {class} property CENTER: JPrinter_Align read _GetCENTER;
    {class} property LEFT: JPrinter_Align read _GetLEFT;
    {class} property RIGHT: JPrinter_Align read _GetRIGHT;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$Align')]
  JPrinter_Align = interface(JEnum)
    ['{67CC6271-16FE-4350-8918-E9808E16EDB2}']
  end;
  TJPrinter_Align = class(TJavaGenericImport<JPrinter_AlignClass, JPrinter_Align>) end;

  JPrinter_BarcodeTypeClass = interface(JEnumClass)
    ['{B2A0645C-A39D-4C6A-91AC-8749A5F04689}']
    {class} function _GetAZTEC: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODABAR: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_128: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_39: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_93: JPrinter_BarcodeType; cdecl;
    {class} function _GetDATA_MATRIX: JPrinter_BarcodeType; cdecl;
    {class} function _GetEAN_13: JPrinter_BarcodeType; cdecl;
    {class} function _GetEAN_8: JPrinter_BarcodeType; cdecl;
    {class} function _GetITF: JPrinter_BarcodeType; cdecl;
    {class} function _GetMAXICODE: JPrinter_BarcodeType; cdecl;
    {class} function _GetPDF_417: JPrinter_BarcodeType; cdecl;
    {class} function _GetQR_CODE: JPrinter_BarcodeType; cdecl;
    {class} function _GetRSS_14: JPrinter_BarcodeType; cdecl;
    {class} function _GetRSS_EXPANDED: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_A: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_E: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_EAN_EXTENSION: JPrinter_BarcodeType; cdecl;
    {class} function valueOf(P1: JString): JPrinter_BarcodeType; cdecl;
    {class} function values: TJavaObjectArray<JPrinter_BarcodeType>; cdecl;
    {class} property AZTEC: JPrinter_BarcodeType read _GetAZTEC;
    {class} property CODABAR: JPrinter_BarcodeType read _GetCODABAR;
    {class} property CODE_128: JPrinter_BarcodeType read _GetCODE_128;
    {class} property CODE_39: JPrinter_BarcodeType read _GetCODE_39;
    {class} property CODE_93: JPrinter_BarcodeType read _GetCODE_93;
    {class} property DATA_MATRIX: JPrinter_BarcodeType read _GetDATA_MATRIX;
    {class} property EAN_13: JPrinter_BarcodeType read _GetEAN_13;
    {class} property EAN_8: JPrinter_BarcodeType read _GetEAN_8;
    {class} property ITF: JPrinter_BarcodeType read _GetITF;
    {class} property MAXICODE: JPrinter_BarcodeType read _GetMAXICODE;
    {class} property PDF_417: JPrinter_BarcodeType read _GetPDF_417;
    {class} property QR_CODE: JPrinter_BarcodeType read _GetQR_CODE;
    {class} property RSS_14: JPrinter_BarcodeType read _GetRSS_14;
    {class} property RSS_EXPANDED: JPrinter_BarcodeType read _GetRSS_EXPANDED;
    {class} property UPC_A: JPrinter_BarcodeType read _GetUPC_A;
    {class} property UPC_E: JPrinter_BarcodeType read _GetUPC_E;
    {class} property UPC_EAN_EXTENSION: JPrinter_BarcodeType read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$BarcodeType')]
  JPrinter_BarcodeType = interface(JEnum)
    ['{FFFE406E-817D-4FAC-917D-CDC12D228774}']
  end;
  TJPrinter_BarcodeType = class(TJavaGenericImport<JPrinter_BarcodeTypeClass, JPrinter_BarcodeType>) end;

  JPrinter_BarcodeWidthClass = interface(JEnumClass)
    ['{A3721743-793C-4116-9E0A-478D76D78D4A}']
    {class} function _GetHUGE: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetLARGE: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetNORMAL: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetSMALL: JPrinter_BarcodeWidth; cdecl;
    {class} function valueOf(P1: JString): JPrinter_BarcodeWidth; cdecl;
    {class} function values: TJavaObjectArray<JPrinter_BarcodeWidth>; cdecl;
    {class} property HUGE: JPrinter_BarcodeWidth read _GetHUGE;
    {class} property LARGE: JPrinter_BarcodeWidth read _GetLARGE;
    {class} property NORMAL: JPrinter_BarcodeWidth read _GetNORMAL;
    {class} property SMALL: JPrinter_BarcodeWidth read _GetSMALL;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$BarcodeWidth')]
  JPrinter_BarcodeWidth = interface(JEnum)
    ['{868438A6-E629-45FD-BB0F-D101C85C4881}']
  end;
  TJPrinter_BarcodeWidth = class(TJavaGenericImport<JPrinter_BarcodeWidthClass, JPrinter_BarcodeWidth>) end;

  JPrinter_FontClass = interface(JEnumClass)
    ['{BFD970ED-D93F-4459-BC86-1C4345570617}']
    {class} function _GetDEFAULT: JPrinter_Font; cdecl;
    {class} function _GetDEFAULT_BOLD: JPrinter_Font; cdecl;
    {class} function _GetMONOSPACE: JPrinter_Font; cdecl;
    {class} function _GetSANS_SERIF: JPrinter_Font; cdecl;
    {class} function _GetSERIF: JPrinter_Font; cdecl;
    {class} function valueOf(P1: JString): JPrinter_Font; cdecl;
    {class} function values: TJavaObjectArray<JPrinter_Font>; cdecl;
    {class} property DEFAULT: JPrinter_Font read _GetDEFAULT;
    {class} property DEFAULT_BOLD: JPrinter_Font read _GetDEFAULT_BOLD;
    {class} property MONOSPACE: JPrinter_Font read _GetMONOSPACE;
    {class} property SANS_SERIF: JPrinter_Font read _GetSANS_SERIF;
    {class} property SERIF: JPrinter_Font read _GetSERIF;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$Font')]
  JPrinter_Font = interface(JEnum)
    ['{5A2C9C7A-AC60-4F1C-8984-AFD2BCAF0076}']
  end;
  TJPrinter_Font = class(TJavaGenericImport<JPrinter_FontClass, JPrinter_Font>) end;

  JRspCodeClass = interface(JObjectClass)
    ['{4BE8AACA-648A-40C3-8B6F-29DE328499CD}']
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetOK: Integer; cdecl;
    {class} function init: JRspCode; cdecl;
    {class} property ERROR: Integer read _GetERROR;
    {class} property OK: Integer read _GetOK;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/RspCode')]
  JRspCode = interface(JObject)
    ['{8656A445-0958-4B79-A88D-30984C90EC7D}']
  end;
  TJRspCode = class(TJavaGenericImport<JRspCodeClass, JRspCode>) end;

  JScanerClass = interface(JBaseBinderClass)
    ['{589C6924-543B-4AF8-A867-B41688B44D0D}']
    {class} function getScanModuleVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function init(P1: JContext): JScaner; cdecl;
    {class} function scanSingle(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Scaner')]
  JScaner = interface(JBaseBinder)
    ['{C8714FB8-C998-478D-BBDB-F596B2FD3129}']
    {class} function getScanModuleVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function init(P1: JContext): JScaner; cdecl;
    {class} function scanSingle(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
  end;
  TJScaner = class(TJavaGenericImport<JScanerClass, JScaner>) end;

  JSpeechUtilClass = interface(JObjectClass)
    ['{00F7B51D-1085-40F7-BAA1-7074DA80551F}']
    {class} function _Getengine_preference: JString; cdecl;
    {class} function _Getpitch_preference: JString; cdecl;
    {class} function _Getrole_cn_preference: JString; cdecl;
    {class} function _Getspeed_preference: JString; cdecl;
    {class} function _Getvolume_preference: JString; cdecl;
    {class} function init: JSpeechUtil; cdecl;
    {class} property engine_preference: JString read _Getengine_preference;
    {class} property pitch_preference: JString read _Getpitch_preference;
    {class} property role_cn_preference: JString read _Getrole_cn_preference;
    {class} property speed_preference: JString read _Getspeed_preference;
    {class} property volume_preference: JString read _Getvolume_preference;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/SpeechUtil')]
  JSpeechUtil = interface(JObject)
    ['{D223D8E7-C0FA-4016-B73E-CF8C0A8924E3}']
  end;
  TJSpeechUtil = class(TJavaGenericImport<JSpeechUtilClass, JSpeechUtil>) end;

  JUpdatespClass = interface(JBaseBinderClass)
    ['{833011FC-9258-4F85-AF70-0CCE30BDA8F3}']
    {class} function init(P1: JContext): JUpdatesp; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Updatesp')]
  JUpdatesp = interface(JBaseBinder)
    ['{92DEF3FC-98C0-4A53-8DEB-862227693774}']
    function getStatus: TJavaObjectArray<JString>; cdecl;
    function updatesp(P1: JString): Integer; cdecl;
  end;
  TJUpdatesp = class(TJavaGenericImport<JUpdatespClass, JUpdatesp>) end;

  JWifiCollectionClass = interface(JBaseBinderClass)
    ['{46218B3B-D5AC-44D8-938F-69BA6569136C}']
    {class} function CollectionWIFIInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function GetAtVersion: JString; cdecl;
    {class} function SetCollectionCycleTime(P1: Integer): Integer; cdecl;
    {class} function StopCollection: Integer; cdecl;
    {class} function init(P1: JContext): JWifiCollection; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/WifiCollection')]
  JWifiCollection = interface(JBaseBinder)
    ['{469D45A5-D2FD-4199-BA5B-1B18B02B1E80}']
  end;
  TJWifiCollection = class(TJavaGenericImport<JWifiCollectionClass, JWifiCollection>) end;

  JWifiProbeClass = interface(JBaseBinderClass)
    ['{B51C15F5-4611-450E-A1B9-48165560B746}']
    {class} function close: Integer; cdecl;
    {class} function getVersion: JString; cdecl;
    {class} function init(P1: JContext): JWifiProbe; cdecl;
    {class} function open: Integer; cdecl;
    {class} function setRate(P1: Integer): Integer; cdecl;
    {class} function startSearch(P1: JIWifiProbeListener): Integer; cdecl;
    {class} function stopSearch: Integer; cdecl;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/WifiProbe')]
  JWifiProbe = interface(JBaseBinder)
    ['{252ECA1F-E1F6-416B-A025-A9006A2947FA}']
  end;
  TJWifiProbe = class(TJavaGenericImport<JWifiProbeClass, JWifiProbe>) end;

  JGeneratePinPrepareDataParametersClass = interface(JObjectClass)
    ['{82C86C3C-29E8-4D4F-B078-7C8EDB103FFB}']
    {class} function _GetBackData: TJavaArray<Byte>; cdecl;
    {class} function init: JGeneratePinPrepareDataParameters; cdecl;
    {class} property BackData: TJavaArray<Byte> read _GetBackData;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/entity/GeneratePinPrepareDataParameters')]
  JGeneratePinPrepareDataParameters = interface(JObject)
    ['{B024967E-4D1F-41BC-90D0-636D5D206486}']
    function _Getbtnb0: JButton; cdecl;
    function _Getbtnb1: JButton; cdecl;
    function _Getbtnb2: JButton; cdecl;
    function _Getbtnb3: JButton; cdecl;
    function _Getbtnb4: JButton; cdecl;
    function _Getbtnb5: JButton; cdecl;
    function _Getbtnb6: JButton; cdecl;
    function _Getbtnb7: JButton; cdecl;
    function _Getbtnb8: JButton; cdecl;
    function _Getbtnb9: JButton; cdecl;
    function _Getbtnback: JButton; cdecl;
    function _Getbtncancel: JButton; cdecl;
    function _Getbtnclean: JButton; cdecl;
    function _Getbtnconfirm: JButton; cdecl;
    function _GetmActivity: JActivity; cdecl;
    property btnb0: JButton read _Getbtnb0;
    property btnb1: JButton read _Getbtnb1;
    property btnb2: JButton read _Getbtnb2;
    property btnb3: JButton read _Getbtnb3;
    property btnb4: JButton read _Getbtnb4;
    property btnb5: JButton read _Getbtnb5;
    property btnb6: JButton read _Getbtnb6;
    property btnb7: JButton read _Getbtnb7;
    property btnb8: JButton read _Getbtnb8;
    property btnb9: JButton read _Getbtnb9;
    property btnback: JButton read _Getbtnback;
    property btncancel: JButton read _Getbtncancel;
    property btnclean: JButton read _Getbtnclean;
    property btnconfirm: JButton read _Getbtnconfirm;
    property mActivity: JActivity read _GetmActivity;
  end;
  TJGeneratePinPrepareDataParameters = class(TJavaGenericImport<JGeneratePinPrepareDataParametersClass, JGeneratePinPrepareDataParameters>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JAnimator', TypeInfo(wangpos.sdk4.libbasebinder.JAnimator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JAnimator_AnimatorListener', TypeInfo(wangpos.sdk4.libbasebinder.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JAnimator_AnimatorPauseListener', TypeInfo(wangpos.sdk4.libbasebinder.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JKeyframe', TypeInfo(wangpos.sdk4.libbasebinder.JKeyframe));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JLayoutTransition', TypeInfo(wangpos.sdk4.libbasebinder.JLayoutTransition));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JLayoutTransition_TransitionListener', TypeInfo(wangpos.sdk4.libbasebinder.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPropertyValuesHolder', TypeInfo(wangpos.sdk4.libbasebinder.JPropertyValuesHolder));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JStateListAnimator', TypeInfo(wangpos.sdk4.libbasebinder.JStateListAnimator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTimeInterpolator', TypeInfo(wangpos.sdk4.libbasebinder.JTimeInterpolator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTypeConverter', TypeInfo(wangpos.sdk4.libbasebinder.JTypeConverter));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTypeEvaluator', TypeInfo(wangpos.sdk4.libbasebinder.JTypeEvaluator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JValueAnimator', TypeInfo(wangpos.sdk4.libbasebinder.JValueAnimator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JValueAnimator_AnimatorUpdateListener', TypeInfo(wangpos.sdk4.libbasebinder.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPathMotion', TypeInfo(wangpos.sdk4.libbasebinder.JPathMotion));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JScene', TypeInfo(wangpos.sdk4.libbasebinder.JScene));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransition', TypeInfo(wangpos.sdk4.libbasebinder.JTransition));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransition_EpicenterCallback', TypeInfo(wangpos.sdk4.libbasebinder.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransition_TransitionListener', TypeInfo(wangpos.sdk4.libbasebinder.JTransition_TransitionListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransitionManager', TypeInfo(wangpos.sdk4.libbasebinder.JTransitionManager));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransitionPropagation', TypeInfo(wangpos.sdk4.libbasebinder.JTransitionPropagation));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JTransitionValues', TypeInfo(wangpos.sdk4.libbasebinder.JTransitionValues));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JInterpolator', TypeInfo(wangpos.sdk4.libbasebinder.JInterpolator));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JToolbar_LayoutParams', TypeInfo(wangpos.sdk4.libbasebinder.JToolbar_LayoutParams));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBaseService', TypeInfo(wangpos.sdk4.libbasebinder.JIBaseService));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBaseService_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JIBaseService_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBaseService_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JIBaseService_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBinderPool', TypeInfo(wangpos.sdk4.libbasebinder.JIBinderPool));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBinderPool_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JIBinderPool_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIBinderPool_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JIBinderPool_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICallbackListener', TypeInfo(wangpos.sdk4.libbasebinder.JICallbackListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICallbackListener_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JICallbackListener_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICallbackListener_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JICallbackListener_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICommonCallback', TypeInfo(wangpos.sdk4.libbasebinder.JICommonCallback));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICommonCallback_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JICommonCallback_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JICommonCallback_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JICommonCallback_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIDecodeCallback', TypeInfo(wangpos.sdk4.libbasebinder.JIDecodeCallback));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIDecodeCallback_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JIDecodeCallback_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIDecodeCallback_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JIDecodeCallback_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIWifiProbeListener', TypeInfo(wangpos.sdk4.libbasebinder.JIWifiProbeListener));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIWifiProbeListener_Stub', TypeInfo(wangpos.sdk4.libbasebinder.JIWifiProbeListener_Stub));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIWifiProbeListener_Stub_Proxy', TypeInfo(wangpos.sdk4.libbasebinder.JIWifiProbeListener_Stub_Proxy));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBaseBinder', TypeInfo(wangpos.sdk4.libbasebinder.JBaseBinder));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBankCard', TypeInfo(wangpos.sdk4.libbasebinder.JBankCard));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBaseBinder_1', TypeInfo(wangpos.sdk4.libbasebinder.JBaseBinder_1));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBaseBinder_2', TypeInfo(wangpos.sdk4.libbasebinder.JBaseBinder_2));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBaseServiceManager', TypeInfo(wangpos.sdk4.libbasebinder.JBaseServiceManager));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JBaseServiceManager_BaseServiceManagerHolder', TypeInfo(wangpos.sdk4.libbasebinder.JBaseServiceManager_BaseServiceManagerHolder));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.Jlibbasebinder_BuildConfig', TypeInfo(wangpos.sdk4.libbasebinder.Jlibbasebinder_BuildConfig));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JCore', TypeInfo(wangpos.sdk4.libbasebinder.JCore));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JCore_1', TypeInfo(wangpos.sdk4.libbasebinder.JCore_1));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JCore_2', TypeInfo(wangpos.sdk4.libbasebinder.JCore_2));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JDock', TypeInfo(wangpos.sdk4.libbasebinder.JDock));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.Jlibbasebinder_HEX', TypeInfo(wangpos.sdk4.libbasebinder.Jlibbasebinder_HEX));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JIDCard', TypeInfo(wangpos.sdk4.libbasebinder.JIDCard));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.Jlibbasebinder_Printer', TypeInfo(wangpos.sdk4.libbasebinder.Jlibbasebinder_Printer));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPrinter_Align', TypeInfo(wangpos.sdk4.libbasebinder.JPrinter_Align));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPrinter_BarcodeType', TypeInfo(wangpos.sdk4.libbasebinder.JPrinter_BarcodeType));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPrinter_BarcodeWidth', TypeInfo(wangpos.sdk4.libbasebinder.JPrinter_BarcodeWidth));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JPrinter_Font', TypeInfo(wangpos.sdk4.libbasebinder.JPrinter_Font));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JRspCode', TypeInfo(wangpos.sdk4.libbasebinder.JRspCode));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JScaner', TypeInfo(wangpos.sdk4.libbasebinder.JScaner));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JSpeechUtil', TypeInfo(wangpos.sdk4.libbasebinder.JSpeechUtil));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JUpdatesp', TypeInfo(wangpos.sdk4.libbasebinder.JUpdatesp));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JWifiCollection', TypeInfo(wangpos.sdk4.libbasebinder.JWifiCollection));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JWifiProbe', TypeInfo(wangpos.sdk4.libbasebinder.JWifiProbe));
  TRegTypes.RegisterType('wangpos.sdk4.libbasebinder.JGeneratePinPrepareDataParameters', TypeInfo(wangpos.sdk4.libbasebinder.JGeneratePinPrepareDataParameters));
end;

initialization
  RegisterTypes;
end.

