@echo off&mode con COLS=68 LINES=26 >nul 2>nul&color 0A&setlocal EnableDelayedExpansion&title Microsoft windows install&pushd "!Windir!\Temp"&set "N= >nul 2>nul"&set "E=cls&echo.&echo.          "&set "E1=!E: =!"&set "E2=!E1:cls=!"&set "G=&pause>nul&goto :End"&set "b=bcdedit"&set "bs=bcdedit /set"&set "WS=!Windir!\System32"&set "WT=!Windir!\Temp"&set "AC=aria2c -c -s32 -x32 -m0 -o"&set "AC1=--console-log-level=warn --summary-interval=888888"&set "W=Windows"&set "WA=!WS!\config\AutoSys"&set "X2=64"&(if "%PROCESSOR_ARCHITECTURE%"=="x86" set "X2=86")&set "WW=http://win11.link/?id="&call :ZH
if exist "!WS!\find.exe" (set "Find=find /i ") else set "Find=findstr /i /C:"
if exist "!WS!\chcp.com" chcp|%Find%"936"%N%||chcp 437%N%&&call :EN
"!WS!\FLTMC.exe"%N%||(%E1%!T15!...%G%)
set "zh-cn_x64=04dcfb20-5583-43e7-8be1-30501b0a1c6e_d867ac31-3ea9-4249-a867-3bd213a6ce44_641685884_ab1cdbe1d"&set "zh-cn_x86=1c0b9500-e99b-4b64-b8a7-920e91e8d09d_d867ac31-3ea9-4249-a867-3bd213a6ce44_5f78c2028_ab1cdbe1d"&set "zh-tw_x64=e626eb96-8ce0-42ab-9fa9-65ae5d822e5c_30897fb3-0065-4c38-afe8-2d99792b96c6_f5514d916_6c7140e69"&set "zh-tw_x86=aba4f41b-d914-4c99-b3e8-f5dcd423c63e_30897fb3-0065-4c38-afe8-2d99792b96c6_85fb10af6_6c7140e69"&set "en-us_x64=f7d48c2e-eb2c-4f13-97e1-45a08c90bcfe_5c5cedfc-2821-4395-a497-c9c45ec24194_a728f841c_b2d39268b"&set "en-us_x86=91c7756c-5b20-4342-8651-e5186d978951_5c5cedfc-2821-4395-a497-c9c45ec24194_87419f641_b2d39268b"&set "L=zh-CN"&set "X=64"&set "X1=64"&set "U="&set "CS=%~1%~2%~3%~4"
if not defined CS goto :Begin
echo "!CS!"|%Find%"32"%N%&&set "X=86"&&set "X1=32"
echo "!CS!"|%Find%"#C"%N%&&set "Clear=Yes"
for %%i in (zh-CN zh-TW en-US) do echo "!CS!"|%Find%"%%i"%N%&&set "L=%%i"&&goto :Next
:Next
if defined CS set "CS=!CS:32=!"
if defined CS set "CS=!CS:64=!"
if defined CS set "CS=!CS:%L%=!"
echo "!CS!"|%Find%"#u"%N%&&set "U=u"
echo "!CS!"|%Find%"#a"%N%&&set "U=a"
if not defined U set "U="
if defined CS set "CS=!CS:#%U%=!"
if defined CS set "F=!CS!"
:Begin
set "LX=!%L%_x%X%!"&set "M1=!LX:~-19,-10!"&set "M2=!LX:~-9!"&set "LX10=!LX:~0,36!"&set "LX11=!LX:~37,36!"
cls&echo.&echo.  [1]  !W! 7   !T16! !X1!!T6! !L!&echo.&echo.  [2]  !W! 8.1 !T11! !X1!!T6! !L!&echo.&echo.  [3]  !W! 10  !T9! !X1!!T6! !L!&echo.&echo.  [4]  !W! 10  !T10! !X1!!T6! !L!&echo.&echo.  [5]  !W! 10  !T11! !X1!!T6! !L!&echo.&echo.  [6]  !W! 11  !T9! 64!T6! !L!&echo.&echo.  [7]  !W! 11  !T10! 64!T6! !L!&echo.&echo.  [8]  !W! 11  !T11! 64!T6! !L!&echo.&echo.  [9]  !T19!&echo.&echo.  [10] !T23!&echo.&echo.  [X]  !T12!&echo.&set "Name=!W!10_x!X!_!L!.esd"&set "Os=10"&set "M=!M1!"&set "URL=http://dl.delivery.mp.microsoft.com/filestreamingservice/files/!LX10!/19045.3803.231204-0204.22h2_release_svc_refresh_CLIENTCONSUMER_RET_x!X!FRE_!L!.esd"&&if exist !M!.Log set "URL=!WW!10_x!X!"
set /p "errorlevel=_______!T5!:"
set "C=!errorlevel!"
if /i "!C!"=="x" goto :End
%Find%"[!C!]" "%~f0"%N%||(%E1%!T7!"!C!"!T8!...&pause>nul&goto :Begin)
if "!C!"=="10" start !WW!kkmkj&&goto :Begin
if "!C!"=="9" start !WW!cmdpe&&goto :Begin
if !C! GTR 5 set "M=!M2!"&&set "Name=!W!11_!L!.esd"&&set "Os=11"&&set "URL=http://dl.delivery.mp.microsoft.com/filestreamingservice/files/!LX11!/22631.2861.231204-0538.23H2_NI_RELEASE_SVC_REFRESH_CLIENTCONSUMER_RET_x64FRE_!L!.esd"&&if exist !M!.Log set "URL=!WW!11_x64"
set "I=4"
if "!L!"=="zh-CN" (
	if "!C!"=="5" set "I=7"
	if "!C!"=="4" set "I=6"
	if "!C!"=="8" set "I=7"
	if "!C!"=="7" set "I=6"
)
if "!L!"=="zh-TW" (
	if "!C!"=="5" set "I=6"
	if "!C!"=="4" set "I=5"
	if "!C!"=="8" set "I=6"
	if "!C!"=="7" set "I=5"
)
if "!L!"=="en-US" (
	if "!C!"=="5" set "I=9"
	if "!C!"=="4" set "I=7"	
	if "!C!"=="8" set "I=9"
	if "!C!"=="7" set "I=7"
)
if "!C!"=="2" set "M=875c89322"&&set "I=4"&&set "Name=!W!8.1_x!X!.esd"&&set "Os=8.1"&&(if "!X!"=="86" set "M=1262d30f4")&&set "URL=!WW!8_x!X!"
if "!C!"=="1" set "M=9f4e71d73"&&set "I=1"&&set "Name=!W!7.esd"&&set "Os=7"&&set "URL=!WW!7"&&(if "!X!"=="86" set "I=2")&&ver|%Find%"6.1."%N%||(%E1%!T17!...&pause>nul&goto :Begin)
%E1%!T20!%E2%!T21!%E2%!T22!&pause>nul&call :TP&%E%!T3!...&md "!WT!\aria2"%N%
::%E1%!T20!%E2%!T21!%E2%!T22!&pause>nul&start www.cmdpe.com&call :TP&%E%!T3!...&md "!WT!\aria2"%N%
::aria2c -h%N%||(ver|%Find%"6.1."%N%&&bitsadmin /transfer "" !WW!a !WT!\aria2c.Exe%N%||powershell -Command "(New-Object Net.WebClient).DownloadFile('!WW!a1', '"!WT!\aria2c.Exe"')"%N%)
aria2c -h%N%||powershell -Command "(New-Object Net.WebClient).DownloadFile('!WW!a1', '"!WT!\aria2c.Exe"')"%N%
aria2c -h%N%||bitsadmin /transfer "" !WW!a !WT!\aria2c.Exe%N%
%E%   !T1!...&echo.
aria2c -h%N%||(%E1%!T2!...%G%)
!AC! "Md5.exe" !AC1! "!WW!m_x!X2!" -d "!WT!"%N%
!AC! "!Name!" !AC1! "!URL!" -d "!TP!"
%E%   !T1!...&echo.
!AC! "boot.Wim" !AC1! "!WW!t" -d "!WT!"
%E%   !T1!...&echo.
!AC! "boot.Sdi" !AC1! "!WW!s" -d "!WT!"%N%
!AC! "WimEsd.DLL" !AC1! "!WW!-" -d "!WT!"%N%
%E%!T1!...&Md5 "!TP!\!Name!"|%Find%"!M!"%N%||(del /f /q "!TP!\!Name!"%N%&echo !M!>!M!.Log&%E1%!T18!...%G%)
if "!Os!"=="8.1" !AC! "W8.exe" !AC1! "!WW!w8" -d "!WT!"%N%&&W8 "!TP!\!Name!"%N%
set "BcdID=!random:~0,3!!random:~0,2!"&set "BcdID1=fff-6d96-11de-8e71-fffffffffff"&set "BN=Microsoft !W! install"&set "i1={!BcdID!!BcdID1!a}"&set "i2={!BcdID!!BcdID1!b}"
!b! /default {current}%N%
for /f "tokens=2" %%a in ('!b!^|%Find%"!BcdID1!a"') do !b! /delete %%a /cleanup%N%
!b! /create !i2! /d "!BN!" /device%N%&!bs! !i2! ramdisksdidevice partition=!SystemDrive!%N%&!bs! !i2! ramdisksdipath "\!W!\Temp\BOOT.SDI"%N%&!b! /create !i1! /d "!BN!" /application osloader%N%&!bs! !i1! device ramdisk="[!SystemDrive!]\!W!\Temp\BOOT.WIM",!i2!%N%&!bs! !i1! osdevice ramdisk="[!SystemDrive!]\!W!\Temp\BOOT.WIM",!i2!%N%&!bs! !i1! path \!W!\system32\boot\winload.exe%N%
!b!|%Find%"winload.efi"%N%&&!bs! !i1! path \!W!\system32\boot\winload.efi%N%
!bs! !i1! description "!BN!"%N%&!bs! !i1! locale zh-CN%N%&!bs! !i1! inherit {bootloadersettings}%N%&!bs! !i1! systemroot \!W!%N%&!bs! !i1! detecthal Yes%N%&!bs! !i1! winpe Yes%N%&!bs! !i1! ems no%N%&!b! /displayorder !i1! /addlast%N%&!b! /default !i1!%N%&!b! /timeout 3%N%
echo SysFile=!TP!\!Name!>"!WA!"&echo Os=!Os!>>"!WA!"&echo Index=!I!>>"!WA!"&echo Language=!L!>>"!WA!"
if /i "!U!"=="a" echo Unattend=a>>"!WA!"
if /i "!U!"=="u" echo Unattend=u>>"!WA!"
if defined F echo User=!F!>>"!WA!"
if !cSpace! lss 12 echo Format=Yes>>"!WA!"
if /i "!Clear!"=="Yes" echo Clear=Yes>>"!WA!"
%E%    !T4!...%G%
:TP
for %%i in (C D E F G H I J K L M N O P Q R S T U V W Y) do (
	if exist %%i: (
		echo 1 >%%i:\CMDPE.COM
		for /f "skip=7 tokens=3" %%j in ('dir /-c /w %%i:\CMDPE.COM') do (
			del %%i:\CMDPE.COM%N%
			set "Space=%%j"
			set "Space=!Space:~0,-9!"
			if /i "%%i:"=="!SystemDrive!" (
				set "cSpace=!Space!"
				if !Space! lss 16 set "Space="
			)
			if !space! gtr !MaxSpace! set "MaxSpace=!Space!"&&set "TP=%%i:"
		)
	)
)
if not defined TP (%E1%!T14!...%G%)
if !MaxSpace! lss 5 (%E1%!T13!...%G%)
goto :eof
:ZH
set "ET=�밴������˳�"&set "T1=��������ϵͳ�����У����Ե�"&set "T2=����ʧ�ܣ����˳�360��֮����������ԣ�!ET!"&set "T3=���ڽ����������ص�ַ�����Ե�"&set "T4=׼����ɣ�����������"&set "T5=������ѡ��"&set "T6=λ"&set "T7=û�д�"&set "T8=ѡ��밲�����������������"&set "T9=��ͥ��"&set "T10=������"&set "T11=רҵ��"&set "T12=�˳�"&set "T13=�Ҳ������ÿռ����4GB�Ĵ�����Ϊ���ش洢�̣�!ET!"&set "T14=�Ҳ������õĴ�����Ϊ���ش洢�̣�!ET!"&set "T15=���Թ���Ա�������CMD������ʾ����!ET!"&set "T16=�콢��"&set "T17=�˵��Բ����鰲װ!W!7���밴���������"&set "T18=ϵͳ����У�鲻��ȷ�����������أ�!ET!"&set "T19=@_����USBϵͳ��"&set "T20=          ���ѣ���װϵͳ�����C��,C��֮��Ĵ�����Ӱ�졣"&set "T21=         ��C�̰���������������Ҫ,�뱸����C��֮��Ĵ��̡�"&set "T22=                �밴���������...��رմ���..."&set "T23=@_ChatGPT-4.0"&goto :eof
:EN
set "ET= Press anykey to exit"&set "T1=Downloading image, Please wait"&set "T2=Download failed,!ET!"&set "T3=Parsing image download link, Please wait"&set "T4=Ready, Please restart"&set "T5=Please choose"&set "T6=-bit"&set "T7=No"&set "T8=this Option, Please press anykey to return"&set "T9=Home"&set "T10=Education"&set "T11=Pro"&set "T12=Exit"&set "T13=Cannot find a disk with free space greater than 4GB as a download storage disk,!ET!"&set "T14=Cannot find a download available disk storage disk,!ET!"&set "T15=Please run as administrator CMD,!ET!"&set "T16=Ultimate"&set "T17=This computer does not recommend installing !W!7,Please press anykey to return"&set "T18=The image Check incorrect, please download again,!ET!"&set "T19=Make a USB system disk"&set "T20=Reminder: Reinstalling the system will clear the C drive"&set "T21=Please back up the data required by the C drive"&set "T22=Please press any key to continue...or close the window..."&set "T23=ChatGPT-4.0"&goto :eof
:End
cls&del 1.cmd 2>nul&Exit