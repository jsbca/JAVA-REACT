param(
    [Parameter(Mandatory = $true)]
    [int]$Port
)

$netstatExe = Join-Path $env:SystemRoot 'System32\netstat.exe'

if (-not (Test-Path $netstatExe)) {
    exit 0
}

$listenerPid = & $netstatExe -ano |
    Select-String ":$Port" |
    ForEach-Object {
        if ($_ -match 'LISTENING\s+(\d+)$') {
            $Matches[1]
        }
    } |
    Select-Object -First 1

if ($listenerPid -and $listenerPid -match '^\d+$') {
    Write-Output $listenerPid
}
