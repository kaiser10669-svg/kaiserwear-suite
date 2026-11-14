@echo off
chcp 65001 > nul
title Установка Mi Fitness MOD v4 на телефон
color 0B
echo ===================================================================
echo   👑 Mi Fitness MOD v4 (Watch 5 Edition) - Установка на телефон
echo   Автор сборки: Kaiser Dev
echo   Telegram-канал и поддержка: https://t.me/kaiStudi
echo ===================================================================
echo.

set "ADB=adb"
if exist "%~dp0tools\adb.exe" set "ADB=%~dp0tools\adb.exe"

:: Проверка и авто-распаковка base.apk
if not exist "%~dp0base.apk" (
    if exist "%~dp0base.zip" (
        echo [1/3] Распаковка base.apk из base.zip...
        tar -xf "%~dp0base.zip" -C "%~dp0" 2>nul
        if not exist "%~dp0base.apk" (
            powershell -NoProfile -Command "Expand-Archive -Path '%~dp0base.zip' -DestinationPath '%~dp0' -Force"
        )
    )
)

if not exist "%~dp0base.apk" (
    echo [ОШИБКА] Файл base.apk не найден!
    echo Убедитесь, что base.zip или base.apk находится в этой папке.
    echo Также можно скачать полный архив со всеми APK из раздела Releases:
    echo https://github.com/kaiser10669-svg/kaiserwear-suite/releases
    pause
    exit /b 1
)

echo [2/3] Проверка подключенных устройств ADB...
"%ADB%" devices
echo.
echo [3/3] Установка сплит-пакетов Mi Fitness MOD на смартфон...
"%ADB%" install-multiple -r -d -g "%~dp0base.apk" "%~dp0split_config.arm64_v8a.apk" "%~dp0split_config.ru.apk" "%~dp0split_config.xxxhdpi.apk"
if %errorlevel% neq 0 (
    echo.
    echo [ОШИБКА] Не удалось установить пакеты.
    echo Убедитесь, что:
    echo   1. Смартфон подключен по кабелю USB (или Wi-Fi).
    echo   2. Включена "Отладка по USB" в Меню для разработчиков.
    echo   3. На экране смартфона подтвержден запрос "Разрешить отладку с этого компьютера".
    pause
    exit /b %errorlevel%
)
echo.
echo ===================================================================
echo  [УСПЕХ] Mi Fitness MOD v4 успешно установлен на телефон!
echo  Теперь откройте приложение и войдите в свой Mi-аккаунт.
echo  Официальный канал обновлений: https://t.me/kaiStudi
echo ===================================================================
echo.
pause
