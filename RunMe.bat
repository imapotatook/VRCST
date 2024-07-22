@echo off
setlocal enabledelayedexpansion

rem Check if Python is installed
py --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Please install it and try again.
    echo Download Python by pressing Enter.
    pause >nul
    start "" "https://www.python.org/downloads/"
    exit /b
)

rem Check if requirements.txt exists
if not exist requirements.txt (
    echo requirements.txt file not found.
    pause
    exit /b
)

rem Create and activate virtual environment if not already done
if exist venv (
    echo Virtual Environment Already Exists
) else (
    echo Creating Python Virtual Environment
    py -m venv venv
)

echo Sourcing Python Virtual Environment
if exist "venv\Scripts\activate.bat" (
    call .\venv\Scripts\activate.bat
) else (
    call .\venv\bin\activate
)

rem Install required Python modules
echo Installing Modules
py -m pip install -r requirements.txt

rem Check if installation was successful
if %errorlevel% neq 0 (
    echo Failed to install required modules. Check the error messages above.
    pause
    exit /b
)

rem Launch the Python script
py VRCST.py

rem Pause to display results (optional)
pause