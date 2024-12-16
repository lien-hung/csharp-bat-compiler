@echo off
setlocal

set "frm=%WINDIR%\Microsoft.NET\Framework\"
for /f "tokens=* delims=*" %%v in ('dir /b /a:d /o:-n %frm%') do (
    set netver=%%v
    goto :break_loop
)

:break_loop
set csc=%frm%%netver%\csc.exe

call %csc% /nologo %1
if %ERRORLEVEL% EQU 0 echo Compilation successful.
if %ERRORLEVEL% NEQ 0 echo Compilation failed.

endlocal
exit /b 0