@echo off
echo Converting jakarta.* to javax.* for Spring Boot 2.7.x compatibility...
echo.

cd /d "%~dp0src\main\java"

for /r %%f in (*.java) do (
    powershell -Command "(Get-Content '%%f' -Raw) -replace 'import jakarta\.', 'import javax.' | Set-Content '%%f' -NoNewline"
)

echo.
echo Conversion completed!
echo WARNING: Application now uses Log4j 2.14.1 - VULNERABLE to Log4Shell CVE-2021-44228
echo Use ONLY in isolated lab environment!
pause

