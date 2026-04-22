@echo off
title Zengo IP Degistirici - Gercek Mod v2
mode con: cols=80 lines=30
color 0a

:menu
cls
echo.
echo   [1;32m================================================================[0m
echo          ZENGO IP DEĞİŞTİRİCİ - GERÇEK YEREL IP DEĞİŞTİRME
echo   [1;32m================================================================[0m
echo.
echo     Bu script sadece YEREL ag IP'nizi degistirir (public IP degismez!)
echo.
echo          Secenekler:
echo          [1;33m1[0m  - Rastgele statik IP ata (192.168.1.x araligi)
echo          [1;33m2[0m  - Otomatik (DHCP) moduna geri don
echo          [1;33m3[0m  - Mevcut IP'yi goster
echo          herhangi bir tusa bas - Cik
echo.
set /p secim="Seciminiz (1-3): "

if /i "%secim%"=="1" goto statik
if /i "%secim%"=="2" goto dhcp
if /i "%secim%"=="3" goto goster
goto son

:goster
cls
echo Mevcut ag ayarlariniz:
echo.
ipconfig
echo.
pause
goto menu

:dhcp
cls
color 0a
echo.
echo   DHCP moduna donuluyor... (otomatik IP aliniyor)
netsh interface ip set address name="Ethernet" source=dhcp >nul 2>&1
netsh interface ip set dns name="Ethernet" source=dhcp >nul 2>&1
netsh interface ip set address name="Wi-Fi" source=dhcp >nul 2>&1
netsh interface ip set dns name="Wi-Fi" source=dhcp >nul 2>&1
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
echo.
echo   [1;32mBasarili! Otomatik IP moduna donuldu.[0m
timeout /t 3 >nul
goto menu

:statik
cls
color 0a
echo.
echo   [1;33mIP DEĞİŞTİRME BAŞLATILIYOR... LÜTFEN BEKLEYİNİZ[0m
echo.
timeout /t 2 >nul

:: Rastgele IP olustur (ev agi icin tipik aralik)
set /a son1=%random% %% 250 + 2
set IP=192.168.1.%son1%
set MASK=255.255.255.0
set GATEWAY=192.168.1.1
set DNS1=8.8.8.8
set DNS2=8.8.4.4

echo   Hedeflenen yeni IP: [1;33m%IP%[0m
echo.
echo   Baglanti hazirlaniyor...
timeout /t 1 >nul

:: Animasyon
cls & echo   Degistiriliyor: [          ] & timeout /t 1 >nul
cls & echo   Degistiriliyor: [====      ] & timeout /t 1 >nul
cls & echo   Degistiriliyor: [========  ] & timeout /t 1 >nul
cls & echo   Degistiriliyor: [==========] [1;32mTAMAM![0m & timeout /t 1 >nul

:: Gercek IP atama (hem Ethernet hem Wi-Fi dener)
netsh interface ipv4 set address name="Ethernet" static %IP% %MASK% %GATEWAY% 1 >nul 2>&1
netsh interface ipv4 set dns name="Ethernet" static %DNS1% primary >nul 2>&1
netsh interface ipv4 add dns name="Ethernet" %DNS2% index=2 >nul 2>&1

netsh interface ipv4 set address name="Wi-Fi" static %IP% %MASK% %GATEWAY% 1 >nul 2>&1
netsh interface ipv4 set dns name="Wi-Fi" static %DNS1% primary >nul 2>&1
netsh interface ipv4 add dns name="Wi-Fi" %DNS2% index=2 >nul 2>&1

:: Degisiklikten sonra 2 saniye bekle ki sistem uygulasin
timeout /t 2 >nul

:: Aktif IP'yi cek (IPv4 Address satirindan)
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do set AKTIF_IP=%%a
set AKTIF_IP=%AKTIF_IP:~1%

cls
echo.
echo   [1;32m================================================================[0m
echo                  IP DEĞİŞTİRME TAMAMLANDI !
echo   [1;32m================================================================[0m
echo.
echo         Sana uygun görülen (hedeflenen) IP  :  [1;33m%IP%[0m
echo         Sistemin verdiği (aktif) IP         :  [1;33m%AKTIF_IP%[0m
echo.
echo         Subnet Mask    : %MASK%
echo         Varsayilan Ag Geçidi : %GATEWAY%
echo         DNS Sunuculari : %DNS1%  /  %DNS2%
echo.
echo   Not: 
echo     - Internet calismazsa hemen [1;33m2[0m'ye basin (DHCP'ye doner)
echo     - Aginiz 192.168.1.x degilse script calismayabilir
echo.
pause
goto menu

:son
cls
echo Cikis yapiliyor...
timeout /t 2 >nul
exit