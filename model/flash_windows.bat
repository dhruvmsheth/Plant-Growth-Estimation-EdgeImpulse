@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
setlocal
REM go to the folder where this bat script is located
cd /d %~dp0

where /q python
IF ERRORLEVEL 1 (
    GOTO PYTHONNOTINPATHERROR
)

echo If you see a ModuleNotFoundError error, run the following commands to add Python packages
echo      python -m pip install pyserial^>=3.4
echo      python -m pip install inquirer^>=2.7.0
echo .

python -u flash_writer.py -s -d -b 921600 -n edge_impulse_firmware.spk

@pause
exit /b 0

:PYTHONNOTINPATHERROR
echo Cannot find 'python' in your PATH. Install Python before you continue
echo Installation instructions: https://www.python.org/downloads/
@pause
exit /b 1
