@echo off
setlocal
cd /d "%~dp0"
echo ======================================================
echo  Self-Healing AI Automation System - local demo setup
echo ======================================================
if not exist ".venv\Scripts\python.exe" (
  echo [1/4] Creating Python virtual environment...
  py -m venv .venv
  if errorlevel 1 goto :error
)
echo [2/4] Installing backend packages...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r "backend\requirements.txt"
if errorlevel 1 goto :error
echo [3/4] Installing frontend packages...
cd /d "%~dp0frontend"
call npm install
if errorlevel 1 goto :error
echo [4/4] Starting servers in separate windows...
cd /d "%~dp0"
start "SelfHeal API" /D "%~dp0backend" "%~dp0.venv\Scripts\python.exe" -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
start "SelfHeal Frontend" /D "%~dp0frontend" cmd /k npm run dev
echo.
echo Frontend: http://localhost:5173
echo API docs: http://127.0.0.1:8000/docs
echo Keep both server windows open while demoing.
pause
exit /b 0
:error
echo.
echo Setup failed. Check that Python (py), Node.js (npm), and internet access are available.
pause
exit /b 1
