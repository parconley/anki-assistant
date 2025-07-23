@echo off
echo Setting up Anki Assistant for Windows...

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.8 or later from https://python.org
    pause
    exit /b 1
)

REM Create virtual environment
echo Creating virtual environment...
python -m venv anki_assistant_env

REM Activate virtual environment
echo Activating virtual environment...
call anki_assistant_env\Scripts\activate.bat

REM Install requirements
echo Installing requirements...
pip install -r requirements_windows.txt

REM Install PyAudio (may require Visual C++ Build Tools)
echo Installing PyAudio...
pip install PyAudio

REM If PyAudio fails, try with pre-compiled wheel
if errorlevel 1 (
    echo PyAudio installation failed. Trying with pre-compiled wheel...
    pip install pipwin
    pipwin install pyaudio
)

echo.
echo Setup complete!
echo.
echo To run the application:
echo 1. Edit config.py with your OpenAI API key and Anki path
echo 2. Run: anki_assistant_env\Scripts\activate.bat
echo 3. Run: python anki_ai_windows.py
echo.
pause