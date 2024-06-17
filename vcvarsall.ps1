param([String]$Target='x64')

. "$PSScriptRoot/config.ps1"
$VCVarsAll = Join-Path -Path "$VSDir" -ChildPath "VC\Auxiliary\Build\vcvarsall.bat"

if ($null -ne $env:VCINSTALLDIR) {
    Write-Host "[vcvarsall.ps1] VCINSTALLDIR environment variable already set, so you have already set vcvars.
    To change target, start a new shell and recall this script" -ForegroundColor Red
    Exit
}

$tempFile = [IO.Path]::GetTempFileName()
cmd /c " `"$VCVarsAll`" $Target && set " > $tempFile

Get-Content $tempFile | ForEach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        Set-Content "env:\$($matches[1])" $matches[2]
    }
}

Write-Host "[vcvarsall.ps1] Environment initialised for '$Target'" -ForegroundColor Green
