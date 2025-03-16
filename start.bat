@echo off
cls
echo.
echo  ______ _               _____ _                 _    
echo ^|  ____^| ^|             / ____^| ^|               ^| ^|   
echo ^| ^|__  ^| ^| __ _ _   _^| (___ ^| ^|_ _ __ ___  __ _^| ^| __
echo ^|  __^| ^| ^|/ _` ^| ^| ^| ^|\___ \^| __^| '__/ _ \/ _` ^| ^|/ /
echo ^| ^|    ^| ^| (_^| ^| ^|_^| ^|____) ^| ^|_^| ^| ^|  __/ (_^| ^|   ^< 
echo ^|_^|    ^|_^|\__,_^|\__, ^|_____/ \__^|_^|  \___^|\__,_^|_^|\_\
echo                   __/ ^|                              
echo                  ^|___/                               
echo.
echo Starting PlayStreak Platform...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed
    echo Please install Python and try again
    pause
    exit /b 1
)

REM Check if required files exist
if not exist "index.html" (
    echo Error: index.html not found
    echo Please make sure you're in the correct directory
    pause
    exit /b 1
)

REM Kill any process using port 8000
echo Checking if port 8000 is in use...
netstat -ano | findstr :8000 >nul
if not errorlevel 1 (
    echo Port 8000 is in use. Attempting to free it...
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8000') do taskkill /F /PID %%a
    echo Port 8000 has been freed
)

REM Start the server
echo.
echo Starting server...
python server.py
pause
