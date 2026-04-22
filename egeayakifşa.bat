@echo off
color 0d
title Iyiki Dogdun Ege

:: Başlangıç mesajı
echo.
echo ================================
echo        IYIKI DOGDUN EGE!
echo ================================
echo.
timeout /t 2 >nul

:QUESTION
cls
echo Soru: Ilgar'in ayak numarasi kactir?
echo.
echo 1. Zoktay
echo 2. Kikirahmanaga
echo.
set /p choice="Cevabinizi secin (1 veya 2): "

if "%choice%"=="1" goto CORRECT
if "%choice%"=="2" goto WRONG
echo Lutfen dogru secenegi girin!
timeout /t 1 >nul
goto QUESTION

:CORRECT
cls
echo Dogru cevap! 🎉
echo.
echo IYIKI DOGDUN EGE! 🥳🎂
echo.
timeout /t 3 >nul

echo Simdi seni bir surpriz bekliyor...
timeout /t 2 >nul

:: YouTube linkini aç
start "" "https://www.youtube.com/watch?v=LgzTZ3Wlur0"
goto END

:WRONG
echo Yanlis cevap 😕
echo Tekrar dene...
timeout /t 2 >nul
goto QUESTION

:END
