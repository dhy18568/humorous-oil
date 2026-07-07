@echo off
setlocal EnableExtensions

set "PORT=8501"
title Stop HumOil Streamlit :%PORT%

echo [HumOil] Looking for Streamlit on port %PORT%...
set "FOUND="
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /R /C:":%PORT% .*LISTENING"') do (
    set "FOUND=1"
    echo [HumOil] Stopping process %%P...
    taskkill /PID %%P /F
)

if not defined FOUND (
    echo [HumOil] No server is listening on port %PORT%.
) else (
    echo [HumOil] Done.
)

pause
