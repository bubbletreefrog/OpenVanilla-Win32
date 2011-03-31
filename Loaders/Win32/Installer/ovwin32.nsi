; Script generated by the HM NIS Edit Script Wizard.

!include "Registry.nsh"
;!include "LogicLib.nsh"
!include x64.nsh

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "OpenVanilla"
!define PRODUCT_VERSION "0.8.1"
!define PRODUCT_PUBLISHER "OpenVanilla.org"
!define PRODUCT_WEB_SITE "http://openvanilla.org/"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
; ## HKLM = HKEY_LOCAL_MACHINE
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define IME_ROOT_KEY "HKLM"
; ## HKCU = HKEY_CURRENT_USER
!define IME_CURRENT_USER "HKCU"
!define IME_KEY "SYSTEM\CurrentControlSet\Control\Keyboard Layouts"
!define IME_KEY_USER "Keyboard Layout\Preload\"


; .net framework 4.0 version v4.0.30319
!define DOT_MAJOR "4"
!define DOT_MINOR "0"
!define DOT_MINOR_MINOR "30319"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define MUI_HEADERIMAGE 
!define MUI_HEADERIMAGE_NOSTRETCH
!define MUI_HEADERIMAGE_BITMAP "ov-installer2.bmp"
;!define MUI_WELCOMEFINISHPAGE_BITMAP_NOSTRETCH
!define MUI_WELCOMEFINISHPAGE_BITMAP "ov-installer.bmp"



; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\..\License\LICENSE-zh-Hant.rtf"
; Directory page
;!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
;!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "TradChinese"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

; .NET Framework 4.0 testing/installing
; .NET start -----------------------------------
!define BASE_URL http://download.microsoft.com/download
; .net Framework v4.0 URL
!define URL_DOTNET_30319  "${BASE_URL}/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe"

; Variables
;Var "LANGUAGE_DLL_TITLE"
;Var "LANGUAGE_DLL_INFO"
Var "URL_DOTNET"
Var "OSLANGUAGE"
Var "DOTNET_RETURN_CODE"

; Language Strings
LangString DESC_REMAINING ${LANG_TradChinese} " ( �Ѿl %d %s%s )"
LangString DESC_PROGRESS ${LANG_TradChinese} "%d.%01dkB" ;"%dkB (%d%%) of %dkB @ %d.%01dkB/s"
LangString DESC_PLURAL ${LANG_TradChinese} " "
LangString DESC_HOUR ${LANG_TradChinese} "�p��"
LangString DESC_MINUTE ${LANG_TradChinese} "����"
LangString DESC_SECOND ${LANG_TradChinese} "��"
LangString DESC_CONNECTING ${LANG_TradChinese} "�s����..."
LangString DESC_DOWNLOADING ${LANG_TradChinese} "�U�� %s"
LangString DESC_SHORTDOTNET ${LANG_TradChinese} ".Net Framework 4.0"
LangString DESC_LONGDOTNET ${LANG_TradChinese} "Microsoft .Net Framework 4.0"
LangString DESC_DOTNET_DECISION ${LANG_TradChinese} "�w�˦���J�k���e�A�������w�� $(DESC_SHORTDOTNET) $\n�j�P��ĳ�z���w�˧� \
  $(DESC_SHORTDOTNET)$\n�A�~��i��w�˿�J�k�C$\n�Y�A�Q�~��w�� \
  �A�z���q�������s�������C$\n�z�n�~��o���w�˶ܡH"
LangString SEC_DOTNET ${LANG_TradChinese} "$(DESC_SHORTDOTNET) "
LangString DESC_INSTALLING ${LANG_TradChinese} "�w�ˤ�"
LangString DESC_DOWNLOADING1 ${LANG_TradChinese} "�U����"
LangString DESC_DOWNLOADFAILED ${LANG_TradChinese} "�U������:"
LangString ERROR_DOTNET_DUPLICATE_INSTANCE ${LANG_TradChinese} "�w���t�@�� $(DESC_SHORTDOTNET) �Ұʦw�˵{��"
LangString ERROR_NOT_ADMINISTRATOR ${LANG_TradChinese} "�бN�z���v�����ɦܹq���t�κ޲z���A����"
LangString ERROR_INVALID_PLATFORM ${LANG_TradChinese} "�����~�ä��A�Ω�o�ӥ��x"
LangString DESC_DOTNET_TIMEOUT ${LANG_TradChinese} " $(DESC_SHORTDOTNET) �w�ˤw�O��"
LangString ERROR_DOTNET_INVALID_PATH ${LANG_TradChinese} "$(DESC_SHORTDOTNET) �w���� \
  �å��b�H�U���|:$\n"
LangString ERROR_DOTNET_FATAL ${LANG_TradChinese} "�Y�����~�T���o�ͦb�w�� \
  $(DESC_SHORTDOTNET) �L�{����"
;LangString FAILED_DOTNET_INSTALL ${LANG_TradChinese} " $(PRODUCT_NAME) �N�|�~��w�� \
;  $\n �M�ӡA�����\�ॲ������ $(DESC_SHORTDOTNET)�w�˧����A�~�|���`�B�@
LangString FAILED_DOTNET_INSTALL ${LANG_TradChinese} "��J�k�w�˲פ�A$\n�������� $(DESC_SHORTDOTNET)�w�˧����A�~�ॿ�`�i��w��"
;LangString DESC_REMAINING ${LANG_ENGLISH} " (%d %s%s remaining)"
;LangString DESC_PROGRESS ${LANG_ENGLISH} "%d.%01dkB/s" ;"%dkB (%d%%) of %dkB @ %d.%01dkB/s"
;LangString DESC_PLURAL ${LANG_ENGLISH} "s"
;LangString DESC_HOUR ${LANG_ENGLISH} "hour"
;LangString DESC_MINUTE ${LANG_ENGLISH} "minute"
;LangString DESC_SECOND ${LANG_ENGLISH} "second"
;LangString DESC_CONNECTING ${LANG_ENGLISH} "Connecting..."
;LangString DESC_DOWNLOADING ${LANG_ENGLISH} "Downloading %s"
;LangString DESC_SHORTDOTNET ${LANG_ENGLISH} "Microsoft .Net Framework 2.0"
;LangString DESC_LONGDOTNET ${LANG_ENGLISH} "Microsoft .Net Framework 2.0"
;LangString DESC_DOTNET_DECISION ${LANG_ENGLISH} "$(DESC_SHORTDOTNET) is required.$\nIt is strongly \
;  advised that you install$\n$(DESC_SHORTDOTNET) before continuing.$\nIf you choose to continue, \
;  you will need to connect$\nto the internet before proceeding.$\nWould you like to continue with \
;  the installation?"
;LangString SEC_DOTNET ${LANG_ENGLISH} "$(DESC_SHORTDOTNET) "
;LangString DESC_INSTALLING ${LANG_ENGLISH} "Installing"
;LangString DESC_DOWNLOADING1 ${LANG_ENGLISH} "Downloading"
;LangString DESC_DOWNLOADFAILED ${LANG_ENGLISH} "Download Failed:"
;LangString ERROR_DOTNET_DUPLICATE_INSTANCE ${LANG_ENGLISH} "The $(DESC_SHORTDOTNET) Installer is \
;  already running."
;LangString ERROR_NOT_ADMINISTRATOR ${LANG_ENGLISH} "$(DESC_000022)"
;LangString ERROR_INVALID_PLATFORM ${LANG_ENGLISH} "$(DESC_000023)"
;LangString ERROR_NOT_ADMINISTRATOR ${LANG_ENGLISH} "Sorry, you are not the administrator."
;LangString ERROR_INVALID_PLATFORM ${LANG_ENGLISH} "This product is not working on this platform."
;LangString DESC_DOTNET_TIMEOUT ${LANG_ENGLISH} "The installation of the $(DESC_SHORTDOTNET) \
;  has timed out."
;LangString ERROR_DOTNET_INVALID_PATH ${LANG_ENGLISH} "The $(DESC_SHORTDOTNET) Installation$\n\
;  was not found in the following location:$\n"
;LangString ERROR_DOTNET_FATAL ${LANG_ENGLISH} "A fatal error occurred during the installation$\n\
;  of the $(DESC_SHORTDOTNET)."
;LangString FAILED_DOTNET_INSTALL ${LANG_ENGLISH} "The installation of $(PRODUCT_NAME) will$\n\
;  continue. However, it may not function properly$\nuntil $(DESC_SHORTDOTNET)$\nis installed."

; .NET end --------------------------------------------


Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "OpenVanilla-Windows-0.8.1.exe"
InstallDir "$PROGRAMFILES\OpenVanilla"
ShowInstDetails show
ShowUnInstDetails show


Function uninstOld
   ClearErrors
   IfFileExists "$SYSDIR\OVIME.ime" 0 ContinueUnist
      /*
      Delete "$SYSDIR\OVIME.ime"
      IfErrors 0 ContinueUnist
         MessageBox MB_ICONSTOP|MB_OK "�ª��������ѡA�нT�w�z���޲z���v���C"
         Abort
      ContinueUnist:
      	 MessageBox MB_ICONINFORMATION|MB_OK "Delete OVIME.ime ok."
      */
      ContinueUnist:
      SetOverwrite on
      SetOutPath "$TEMP\~nsu.tmp"
      ClearErrors
      IfFileExists "$PROGRAMFILES\OpenVanilla\unist.exe" NewPathUninst OldPathUninst
      NewPathUninst:
        CopyFiles /SILENT "$INSTDIR\uninst.exe" "$TEMP\~nsu.tmp\AU_.exe"
        ExecWait '"$TEMP\~nsu.tmp\Au_.exe" /S _?= $PROGRAMFILES\OpenVanilla' $0
        Goto AfterUninst
      OldPathUninst:
        CopyFiles /SILENT "$WINDIR\OpenVanilla\uninst.exe" "$TEMP\~nsu.tmp\AU_.exe"
        ExecWait '"$TEMP\~nsu.tmp\Au_.exe" /S _?=$WINDIR\OpenVanilla' $0
      AfterUninst:
      Delete "$TEMP\~nsu.tmp\Au_.exe"
      RMDir "$TEMP\~nsu.tmp"
      ClearErrors

      ;Ensure the old IME is deleted
      /*
      Delete "$SYSDIR\OVIME.ime"
      IfErrors 0 +2
         Call onInstError
      */
FunctionEnd 

Function onInstError
   MessageBox MB_ICONSTOP|MB_OK "�w�˥��ѡA�нT�w�z���޲z���v���C"
   Abort
FunctionEnd

Function .onInit
  ${If} ${RunningX64}
        MessageBox MB_OK "���w���ɬ�32bit����, �Э��s�U��64bit����"
        Abort
  ${EndIf}
  Call CheckMSIVer
  Pop $R5 # = "NeedMSI"
  StrCmp $R5 "NeedMSI" NeedWIN31 KeepGo1
  
  NeedWIN31:
     Push "www.microsoft.com/downloads/details.aspx?displaylang=zh-tw&FamilyID=889482fc-5f56-4a38-b838-de776fd4138c"
     Call openLinkNewWindow
     Abort  
  
  KeepGo1:
  Call CheckOffice2003Otk
  Pop $R6 # = "Office2003Otk"
  StrCmp $R6 "Office2003Otk" Need2003Otk KeepGo2
  
  Need2003Otk:
  Push "http://www.microsoft.com/downloads/details.aspx?displaylang=zh-tw&FamilyID=1B0BFB35-C252-43CC-8A2A-6A64D6AC4670"
  Call openLinkNewWindow
  Abort
  
  KeepGo2:
  ReadRegStr $0 ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion"
  StrCmp $0 "" StartInstall 0
	  MessageBox MB_OKCANCEL|MB_ICONQUESTION "�������ª� $0�A�����������~��w�˷s���C�O�_�n�{�b�i��H" IDOK +2
	  Abort
          Call uninstOld          
          IfFileExists "$SYSDIR\OVIME.ime"  0 RemoveFinished     ;�N���Ϧw�˥��� 
          Abort
    RemoveFinished:     
    		MessageBox MB_ICONINFORMATION|MB_OK "�ª��w�����C"
    StartInstall:     
;  !insertmacro MUI_LANGDLL_DISPLAY

;DOTNET start --------------------------------------------
  
  StrCpy $URL_DOTNET "${URL_DOTNET_30319}"
  StrCpy $OSLANGUAGE "30319"
  InitPluginsDir
  SetOutPath "$PLUGINSDIR"
  ;File "Common\Plugins\*.*"
  ;File /r "${NSISDIR}\Plugins\*.*"
;DOTNET end ----------------------------------------------    
FunctionEnd

Function dotNet2AppachKeyIns
${registry::MoveKey} "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\excel.exe" "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\\excel-new.exe" $R5
${registry::MoveKey} "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\winword.exe" "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\\winword-new.exe" $R6
;MessageBox MB_OK "dotNet2AppachKey: $R5" IDOK +1
;MessageBox MB_OK "dotNet2AppachKey: $R6" IDOK +1
FunctionEnd

; 
; Call IsDotNetInstalledAdv
; This function will abort the installation if the required version 
; or higher version of the .NET Framework is not installed.  Place it in
; either your .onInit function or your first install section before 
; other code.
Function IsDotNetInstalledAdv
   Push $0
   Push $1
   Push $2
   Push $3
   Push $4
   Push $5
 
  StrCpy $0 "0"
  StrCpy $1 "SOFTWARE\Microsoft\.NETFramework" ;registry entry to look in.
  StrCpy $2 0
 
  StartEnum:
    ;Enumerate the versions installed.
    EnumRegKey $3 HKLM "$1\policy" $2
 
    ;If we don't find any versions installed, it's not here.
    StrCmp $3 "" noDotNet notEmpty
 
    ;We found something.
    notEmpty:
      ;Find out if the RegKey starts with 'v'.  
      ;If it doesn't, goto the next key.
      StrCpy $4 $3 1 0
      StrCmp $4 "v" +1 goNext
      StrCpy $4 $3 1 1
 
      ;It starts with 'v'.  Now check to see how the installed major version
      ;relates to our required major version.
      ;If it's equal check the minor version, if it's greater, 
      ;we found a good RegKey.
      IntCmp $4 ${DOT_MAJOR} +1 goNext yesDotNet
      ;Check the minor version.  If it's equal or greater to our requested 
      ;version then we're good.
      StrCpy $4 $3 1 3
      IntCmp $4 ${DOT_MINOR} +1 goNext yesDotNet
 
      ;detect sub-version - e.g. 2.0.50727
      ;takes a value of the registry subkey - it contains the small version number
      EnumRegValue $5 HKLM "$1\policy\$3" 0
 
      IntCmpU $5 ${DOT_MINOR_MINOR} yesDotNet goNext yesDotNet
 
    goNext:
      ;Go to the next RegKey.
      IntOp $2 $2 + 1
      goto StartEnum
 
  ;yesDotNetReg: //skip the file check here. trust the registry!!
    ;Now that we've found a good RegKey, let's make sure it's actually
    ;installed by getting the install path and checking to see if the 
    ;mscorlib.dll exists.
    ;EnumRegValue $2 HKLM "$1\policy\$3" 0
    ;$2 should equal whatever comes after the major and minor versions 
    ;(ie, v1.1.4322)
    ;StrCmp $2 "" noDotNet
    ;ReadRegStr $4 HKLM $1 "InstallRoot"
    ;Hopefully the install root isn't empty.
    ;StrCmp $4 "" noDotNet
    ;build the actuall directory path to mscorlib.dll.
    ;StrCpy $4 "$4$3.$2\mscorlib.dll"
    ;IfFileExists $4 yesDotNet noDotNet
    ;Goto yesDotNet	
    
  noDotNet:
    ;Nope, something went wrong along the way.  Looks like the 
    ;proper .NET Framework isn't installed.  
 
    ;Uncomment the following line to make this function throw a message box right away 
    ;MessageBox MB_OK "You must have v${DOT_MAJOR}.${DOT_MINOR}.${DOT_MINOR_MINOR} or greater of the .NET Framework installed. "
    ;Abort
     StrCpy $0 0
     Goto done
 
     yesDotNet:
    ;Everything checks out.  Go on with the rest of the installation.
    StrCpy $0 1
 
   done:
     Pop $4
     Pop $3
     Pop $2
     Pop $1
     Exch $0
 FunctionEnd

;VersionNumberCompare
Function VersionCompare
	!define VersionCompare `!insertmacro VersionCompareCall`
 
	!macro VersionCompareCall _VER1 _VER2 _RESULT
		Push `${_VER1}`
		Push `${_VER2}`
		Call VersionCompare
		Pop ${_RESULT}
	!macroend
 
	Exch $1
	Exch
	Exch $0
	Exch
	Push $2
	Push $3
	Push $4
	Push $5
	Push $6
	Push $7
 
	begin:
	StrCpy $2 -1
	IntOp $2 $2 + 1
	StrCpy $3 $0 1 $2
	StrCmp $3 '' +2
	StrCmp $3 '.' 0 -3
	StrCpy $4 $0 $2
	IntOp $2 $2 + 1
	StrCpy $0 $0 '' $2
 
	StrCpy $2 -1
	IntOp $2 $2 + 1
	StrCpy $3 $1 1 $2
	StrCmp $3 '' +2
	StrCmp $3 '.' 0 -3
	StrCpy $5 $1 $2
	IntOp $2 $2 + 1
	StrCpy $1 $1 '' $2
 
	StrCmp $4$5 '' equal
 
	StrCpy $6 -1
	IntOp $6 $6 + 1
	StrCpy $3 $4 1 $6
	StrCmp $3 '0' -2
	StrCmp $3 '' 0 +2
	StrCpy $4 0
 
	StrCpy $7 -1
	IntOp $7 $7 + 1
	StrCpy $3 $5 1 $7
	StrCmp $3 '0' -2
	StrCmp $3 '' 0 +2
	StrCpy $5 0
 
	StrCmp $4 0 0 +2
	StrCmp $5 0 begin newer2
	StrCmp $5 0 newer1
	IntCmp $6 $7 0 newer1 newer2
 
	StrCpy $4 '1$4'
	StrCpy $5 '1$5'
	IntCmp $4 $5 begin newer2 newer1
 
	equal:
	StrCpy $0 0
	goto end
	newer1:
	StrCpy $0 1
	goto end
	newer2:
	StrCpy $0 2
 
	end:
	Pop $7
	Pop $6
	Pop $5
	Pop $4
	Pop $3
	Pop $2
	Pop $1
	Exch $0
FunctionEnd  

Function CheckMSIVer 
GetDLLVersion "$SYSDIR\msi.dll" $R0 $R1
IntOp $R2 $R0 / 0x00010000 ; $R2 now contains major version
${VersionCompare} $R2 "3" $1
; ## testing MessageBox MB_OK "$1" IDOK +1
${If} $1 == 2 ; VersionCompare the msi installer version, if smaller
MessageBox MB_OK|MB_ICONINFORMATION "�ݭn Windows Installer 3.1 (v2)�A�Цܩx������U���C" IDOK +1
;Call openLinkNewWindow
;Abort
Push "NeedMSI"
${ENDIF}
FunctionEnd

Function CheckOffice2003Otk
;${registry::Open} "HKLM\${CURRENTVERSION_UNINSTALL}" "\NI=microsoft office" $9
;${registry::Find} $9 $1 $2 $3 $4
;MessageBox MB_ICONINFORMATION|MB_OK "show 9:$9 1:$1 2:$2 3:$3 " IDOK +1

ClearErrors
GetDLLVersion "$PROGRAMFILES\Microsoft Office\OFFICE11\ADDINS\Otkloadr.dll" $R0 $R1
IfErrors notOffice2003 0
IntOp $R2 $R0 / 0x00010000 ; $R2 now contains major version
IntOp $R3 $R0 & 0x0000FFFF ; $R3 now contains minor version
IntOp $R4 $R1 / 0x00010000 ; $R4 now contains release
IntOp $R5 $R1 & 0x0000FFFF ; $R5 now contains build
StrCpy $0 "$R2.$R3.$R4.$R5" ; $0 now contains string like "1.2.0.192"
${VersionCompare} $0 "7.10.5077.0" $1
${If} $1 == 2   ;if $0 is smaller
Push "Office2003Otk"
MessageBox MB_OK|MB_ICONINFORMATION "$(^Name)�ݭn Office 2003 �ϥΪ̶i�� patch�A�Цܩx������U���C"IDOK +1
${ENDIF}
notOffice2003:
FunctionEnd

Function openLinkNewWindow
  Pop $0
  Push $3 
  Push $2
  Push $1
  Push $0
  ReadRegStr $0 HKCR "http\shell\open\command" ""
# Get browser path
;    DetailPrint $0
  StrCpy $2 '"'
  StrCpy $1 $0 1
  StrCmp $1 $2 +2 # if path is not enclosed in " look for space as final char
    StrCpy $2 ' '
  StrCpy $3 1
  loop:
    StrCpy $1 $0 1 $3
;    DetailPrint $1
    StrCmp $1 $2 found
    StrCmp $1 "" found
    IntOp $3 $3 + 1
    Goto loop
 
  found:
    StrCpy $1 $0 $3
    StrCmp $2 " " +2
      StrCpy $1 '$1"'

  Pop $0
  Exec '$1 $0'
  Pop $1
  Pop $2
  Pop $3
FunctionEnd

Section $(SEC_DOTNET) SECDOTNET
  SectionIn RO
  IfSilent lbl_IsSilent
      
  StrCpy $DOTNET_RETURN_CODE "0"

  Call IsDotNetInstalledAdv
    Pop $0
  ${If} $0 == 0
    Goto lbl_DownloadRequired
  ${ENDIF}
	  
    Goto lbl_NoDownloadRequired
    
    lbl_DownloadRequired:
    DetailPrint "$(DESC_DOWNLOADING1) $(DESC_SHORTDOTNET)..."
    MessageBox MB_ICONEXCLAMATION|MB_YESNO|MB_DEFBUTTON2 "$(DESC_DOTNET_DECISION)" /SD IDNO \
      IDYES +2 IDNO 0
    Abort
    ; "Downloading Microsoft .Net Framework"
    AddSize 153600
    nsisdl::download /TRANSLATE "$(DESC_DOWNLOADING)" "$(DESC_CONNECTING)" \
       "$(DESC_SECOND)" "$(DESC_MINUTE)" "$(DESC_HOUR)" "$(DESC_PLURAL)" \
       "$(DESC_PROGRESS)" "$(DESC_REMAINING)" \
       /TIMEOUT=30000 "$URL_DOTNET" "$PLUGINSDIR\dotnetfx.exe"
    Pop $0
    StrCmp "$0" "success" lbl_continue
    DetailPrint "$(DESC_DOWNLOADFAILED) $0"
    Abort
 
    lbl_continue:
      DetailPrint "$(DESC_INSTALLING) $(DESC_SHORTDOTNET)..."
      ;Banner::show /NOUNLOAD "$(DESC_INSTALLING) $(DESC_SHORTDOTNET)..."
      ;nsExec::ExecToStack '"$PLUGINSDIR\dotnetfx.exe" /q /c:"install.exe /noaspupgrade /q"'
      nsExec::ExecToStack "$PLUGINSDIR\dotnetfx.exe /q"
      pop $DOTNET_RETURN_CODE
      ;MessageBox MB_ICONINFORMATION|MB_OK "show dotnet return code:$DOTNET_RETURN_CODE" IDOK +1
      ;Banner::destroy
      ;SetRebootFlag true
      ; silence the compiler
      Goto lbl_NoDownloadRequired
    
      lbl_NoDownloadRequired:
 
      ; obtain any error code and inform the user ($DOTNET_RETURN_CODE)
      ; If nsExec is unable to execute the process,
      ; it will return "error"
      ; If the process timed out it will return "timeout"
      ; else it will return the return code from the executed process.
      StrCmp "$DOTNET_RETURN_CODE" "" lbl_NoError
      StrCmp "$DOTNET_RETURN_CODE" "0" lbl_NoError
      StrCmp "$DOTNET_RETURN_CODE" "3010" lbl_NoError ;indicate success with a reboot required
      StrCmp "$DOTNET_RETURN_CODE" "8192" lbl_NoError ;reboot is required
      StrCmp "$DOTNET_RETURN_CODE" "error" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "timeout" lbl_TimeOut
      ; It's a .Net Error
      StrCmp "$DOTNET_RETURN_CODE" "4097" lbl_Error_NotAdministrator
      StrCmp "$DOTNET_RETURN_CODE" "4098" lbl_Error_InstallMSIFailed ; need new step
      StrCmp "$DOTNET_RETURN_CODE" "4099" lbl_Error_WInstallerNotProper ; need new step
      StrCmp "$DOTNET_RETURN_CODE" "4100" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4101" lbl_Error_DuplicateInstance
      StrCmp "$DOTNET_RETURN_CODE" "4102" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4103" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4111" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4113" lbl_Error_BetaRemove ; need new step
      StrCmp "$DOTNET_RETURN_CODE" "4115" lbl_Error ; temp path is too long
      StrCmp "$DOTNET_RETURN_CODE" "4116" lbl_Error ; the source path is too long
      StrCmp "$DOTNET_RETURN_CODE" "4118" lbl_Error ; fail to create log file
      StrCmp "$DOTNET_RETURN_CODE" "4119" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4120" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4121" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4122" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "4123" lbl_Error ; already in os component like vista
      StrCmp "$DOTNET_RETURN_CODE" "4124" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "8191" lbl_Error
      StrCmp "$DOTNET_RETURN_CODE" "1602" lbl_Error_UserCancel ; need new step
      
      
      StrCmp "$DOTNET_RETURN_CODE" "1633" lbl_Error_InvalidPlatform lbl_FatalError
      ; all others are fatal
 
    lbl_Error_InstallMSIFailed:
    lbl_Error_WInstallerNotProper:
    DetailPrint "Windows Installer �w�˥���"
    GoTo lbl_Done
    
    lbl_Error_BetaRemove:
    DetailPrint "���������� .Net Framework Beta ��"
    GoTo lbl_Done
    
    lbl_Error_UserCancel:
    DetailPrint "�ϥΪ̦ۦ����"
    GoTo lbl_Done
    
    lbl_Error_DuplicateInstance:
    DetailPrint "$(ERROR_DOTNET_DUPLICATE_INSTANCE)"
    GoTo lbl_Done
 
    lbl_Error_NotAdministrator:
    DetailPrint "$(ERROR_NOT_ADMINISTRATOR)"
    GoTo lbl_Done
 
    lbl_Error_InvalidPlatform:
    DetailPrint "$(ERROR_INVALID_PLATFORM)"
    GoTo lbl_Done
 
    lbl_TimeOut:
    DetailPrint "$(DESC_DOTNET_TIMEOUT)"
    GoTo lbl_Done
 
    lbl_Error:
    DetailPrint "$(ERROR_DOTNET_INVALID_PATH)"
    GoTo lbl_Done
 
    lbl_FatalError:
    DetailPrint "$(ERROR_DOTNET_FATAL)[$DOTNET_RETURN_CODE]"
    GoTo lbl_Done
 
    lbl_Done:
    DetailPrint "$(FAILED_DOTNET_INSTALL)"
    Abort
    
    lbl_NoError:
    lbl_IsSilent:  
  SectionEnd

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SECDOTNET} $(DESC_LONGDOTNET)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Section "CheckVersion" CV1
;  ReadRegStr $0 ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion"
;  StrCmp $0 "" ContinueInst 0
;          MessageBox MB_OKCANCEL|MB_ICONQUESTION "�������ª� $0�A�����������~��w�˷s���C�O�_�n�{�b�i��H" IDOK +2
;	  Abort
;          Call uninstOld
;    ContinueInst:      
;SectionEnd          

Section "MainSection" SEC01
  SetOutPath "$SYSDIR"
  SetOverwrite ifnewer
  File "system32.x86\OVIME.ime"
  File "system32.x86\*.dll"
SectionEnd

Section "Modules" SEC02
 ; SetOutPath "C:\OpenVanilla"
 ; SetOutPath "C:\"
SetOutPath $PROGRAMFILES
  SetOVerwrite ifnewer
  File /r /x ".svn" /x "x64" "OpenVanilla"
  nsExec::ExecToStack '"$INSTDIR\GacUtil.exe" uninstall "$INSTDIR\OVManagedUI.dll"'
  nsExec::ExecToStack '"$INSTDIR\GacUtil.exe" install "$INSTDIR\OVManagedUI.dll"'
;SetOutPath "$APPDATA\OpenVanilla\"
;  File /r /x ".svn" "UserData\*.*"
;  File "config.xml"
;  File "orz.txt"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  CreateDirectory "$SMPROGRAMS\OpenVanilla"
  CreateShortCut "$SMPROGRAMS\OpenVanilla\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$SMPROGRAMS\OpenVanilla\OVPreferences.lnk" "$INSTDIR\OVPreferences.exe"
SectionEnd

Section -Post
  Call dotNet2AppachKeyIns
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
  System::Call 'imm32::ImmInstallIME(t "$SYSDIR\OVIME.ime", t "$(^Name)")'
  ${registry::Open} "${IME_ROOT_KEY}\${IME_KEY}" "/N='OVIME.ime' /G=1 /T=REG_SZ" $0
  ${registry::Find} $0 $1 $2 $3 $4
  StrCpy $6 $1 "" -8
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Key" "$6"
  ${registry::Close} "$0"
  System::Call "user32::LoadKeyboardLayout(l $6, i 1)"
SectionEnd

Function un.onUninstSuccess  
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)�w�������\�C" /SD IDOK
FunctionEnd

Function un.onInit
;!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "�T�w�n��������$(^Name)�H" /SD IDYES IDYES +2
  Abort
FunctionEnd

Section Uninstall
  ReadRegStr $0 ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Key"
  System::Call "user32::UnloadKeyboardLayout(l r0) i .r1 ?e"
  ${If} $1 == 0
    Call :lbNeedReboot
  ${EndIf}

  ClearErrors
  Delete "$SYSDIR\OVIME.ime"
  IfErrors lbNeedReboot lbContinueUninstall

  lbNeedReboot:
  MessageBox MB_ICONSTOP|MB_YESNO "�����즳�{�����b�ϥο�J�k�A�Э��s�}���H�~�򲾰��ª��C�O�_�n�ߧY���s�}���H" IDNO lbNoReboot
  Reboot

  lbNoReboot:
  MessageBox MB_ICONSTOP|MB_OK "�бN�Ҧ��{�������A�A���հ��楻�w�˵{���C�Y���ݨ즹�e���A�Э��s�}���C" IDOK +1
  Quit

  lbContinueUninstall:
  ReadRegStr $0 ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Key"
  DeleteRegKey ${IME_ROOT_KEY} "${IME_KEY}\$0"
  
  ${registry::Open} "${IME_CURRENT_USER}\" " /V=1 /S=1 /N='$0' /G=1 /T=REG_SZ" $9
  ${registry::Find} $9 $1 $2 $3 $4  
  DeleteRegValue "${IME_CURRENT_USER}" "${IME_KEY_USER}" "$2"
  ${registry::Close} "$9"

  ${registry::MoveKey} "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\excel-new.exe" "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\\excel.exe" $R5
  ${registry::MoveKey} "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\winword-new.exe" "HKLM\SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\\winword.exe" $R6

  nsExec::ExecToStack '"$INSTDIR\GacUtil.exe" uninstall "OVIME.dll"'

  Delete "$SYSDIR\OVIMEUI.dll"
  Delete "$SYSDIR\libltdl3.dll"
  Delete "$SYSDIR\sqlite3.dll"
  Delete "$SYSDIR\libhunspell.dll"
  Delete "$INSTDIR\uninst.exe"
;  RMDir /r "$PROGRAMFILES\OpenVanilla"
  RMDir /r "$INSTDIR"
  Delete "$SMPROGRAMS\OpenVanilla\Uninstall.lnk"
  Delete "$SMPROGRAMS\OpenVanilla\OVPreferences.lnk"
  RMDir "$SMPROGRAMS\OpenVanilla"
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd