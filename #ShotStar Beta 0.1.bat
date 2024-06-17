@echo off
mode con cols=20 lines=15
set sec=3
set score=0
set monster=¡¹ 
set num15= - & set num25= - & set num35= -
set num14= - & set num24= - & set num34= -
set num13= - & set num23= - & set num33= -
set num12= - & set num22= - & set num32= -
set num11= - & set num21= - & set num31= -
:top
cls
echo  score: %score%
echo=
echo=
echo          %sec%
echo=
echo=
echo -----------------
echo shoot shoot shoot
echo   b     n      m
timeout /t 1 /nobreak >nul
set /a sec=sec-1
if "%sec%" == "0" goto start
goto top
:start
set /a s1=%random%%%3+1
set /a s2=%random%%%3+1
set /a s3=%random%%%3+1
set /a s4=%random%%%3+1
set /a s5=%random%%%3+1
set num%s1%1=%monster%
set num%s2%2=%monster%
set num%s3%3=%monster%
set num%s4%4=%monster%
set num%s5%5=%monster%
:game
cls
echo  score: %score%
echo  %num15%   %num25%    %num35%
echo  %num14%   %num24%    %num34%
echo  %num13%   %num23%    %num33%
echo  %num12%   %num22%    %num32%
echo  %num11%   %num21%    %num31%
echo -----------------
echo shoot shoot shoot
echo   b     n      m
choice /c:asdbnm >nul

if errorlevel 6 goto d
if errorlevel 5 goto s
if errorlevel 4 goto a 
if errorlevel 3 goto d
if errorlevel 2 goto s
if errorlevel 1 goto a 

:a
if not "%num11%" == "%monster%" goto game
echo ^G
goto prize
:s
if not "%num21%" == "%monster%" goto game
goto prize
:d
if not "%num31%" == "%monster%" goto game
goto prize
:prize
set /a score=score+10

set num11=%num12%
set num21=%num22%
set num31=%num32%

set num12=%num13%
set num22=%num23%
set num32=%num33%

set num13=%num14%
set num23=%num24%
set num33=%num34%

set num14=%num15%
set num24=%num25%
set num34=%num35%

set /a r=%random%%%3+1
set num%r%5=%monster%
if "%r%" == "1" set num25= - & set num35= -
if "%r%" == "2" set num15= - & set num35= -
if "%r%" == "3" set num15= - & set num25= - 
goto game


