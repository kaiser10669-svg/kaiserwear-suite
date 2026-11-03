@echo off
chcp 65001 > nul
echo ===================================================================
echo  Mi Fitness MOD v4 (Watch 5 Edition) - Установка на телефон
echo ===================================================================
echo.
echo Проверка подключенных устройств ADB...
adb devices
echo.
echo Установка сплит-пакетов Mi Fitness на телефон...
adb install-multiple -r -d -g base.apk split_config.arm64_v8a.apk split_config.ru.apk split_config.xxxhdpi.apk
if %errorlevel% neq 0 (
    echo.
    echo [ОШИБКА] Не удалось установить пакеты. Убедитесь, что телефон подключен по USB/Wi-Fi и включена отладка по USB.
    pause
    exit /b %errorlevel%
)
echo.
echo [УСПЕХ] Mi Fitness MOD v4 успешно установлен и обновлен на телефоне!
echo.
pause
