# PowerShell script to convert jakarta.* imports to javax.*
# FOR EDUCATIONAL LAB PURPOSES ONLY

Write-Host "Converting jakarta.* imports to javax.*..." -ForegroundColor Yellow

$files = Get-ChildItem -Path "src\main\java" -Recurse -Filter "*.java"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content

    # Convert jakarta to javax
    $content = $content -replace 'import jakarta\.persistence\.', 'import javax.persistence.'
    $content = $content -replace 'import jakarta\.servlet\.', 'import javax.servlet.'
    $content = $content -replace 'import jakarta\.validation\.', 'import javax.validation.'
    $content = $content -replace 'import jakarta\.transaction\.', 'import javax.transaction.'
    $content = $content -replace 'import jakarta\.annotation\.', 'import javax.annotation.'

    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
    }
}

Write-Host "`nConversion completed!" -ForegroundColor Green
Write-Host "WARNING: This application now uses Log4j 2.14.1 (VULNERABLE to Log4Shell CVE-2021-44228)" -ForegroundColor Red
Write-Host "Use ONLY in isolated lab environment!" -ForegroundColor Red

