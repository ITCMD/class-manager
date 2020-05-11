@echo off
title Class Manager for Liberty University ^| By ITCMD
if not exist "Class Manager On Top.exe" (
	if exist "Class Manager On Top.ahk" start "" "Class Manager On top.ahk" /MIN
) ELSE (
	start "" "Class Manager On top.exe" /MIN
)
setlocal EnableDelayedExpansion
@mode con lines=8 cols=60
:menu
echo Loading . . .
set lines=6
cls
for /f "tokens=*" %%A in ('dir /b Classes\*.bat') do ( set /a lines+=1)
@mode con lines=%lines% cols=60
cls
echo [102;30m           ~ Select a class from the list below ~           [0m
echo.


set num=0
for /f "tokens=*" %%A in ('dir /b Classes\*.bat') do (
	call "Classes\%%~A"
	set /a num+=1
	echo  !num!] [32m!cnum! [37m!cname![0m
	set class!num!=%%~A
)



echo  B] [36mOpen Blackboard [37mLiberty University[0m
echo [90m
choice /c B123456789QWERTYUIOP
set /a _err=%errorlevel% -1
if "%_err%"=="0" (
	start https://learn.liberty.edu/webapps/lulm-lander-BBLEARN/app/lander.jsp?tab_tab_group_id=_103_1
	goto menu
)
echo [0m
set class=!class%_err%!
call "Classes\%class%"
@mode con lines=10 cols=60
cls
echo [32mClass: %cname% [90m%cnum%[0m
echo [37mProfessor [32m%pname%[0m
echo.
echo 1] View Announcements
echo 2] View Weekly Course Content
echo 3] View Grades
if /i "%pmail%"=="unknown" (
	echo [90m4] Email Professor[0m
) ELSE (
	echo 4] Email Professor [[36m%pmail%[0m]
)
echo [37mX] Go Back[0m
echo.
:wait
choice /c 1234x /n >nul 2>nul
if %errorlevel%==1 start %announcements%
if %errorlevel%==2 goto assignment
if %errorlevel%==3 start %grades%
if %errorlevel%==4 goto mail
goto menu

:assignment
cls
echo [32mClass: %cname% [90m%cnum%[0m
echo [37mProfessor [32m%pname%[0m
echo.
echo [32mPlease select a week number [90mor press X to cancel.[0m
choice /c 12345678X
if %errorlevel%==9 goto menu
set /a week=%weekstartminusone%+%errorlevel%
echo %assignmentss%%week%%assignmentse%>>out.txt
start %assignmentss%%week%%assignmentse%
goto menu

:mail
if /i "%pmail%"=="unknown" goto wiat
outlook.exe /c ipm.note /m %pmail%
goto menu