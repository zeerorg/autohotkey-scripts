$startupFolder = "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\StartUp"
$currentDir = $(Get-Location)
$WshShell = New-Object -comObject WScript.Shell

Get-ChildItem $currentDir -Filter *.ahk | 
Foreach-Object {
    $name = $_.Name
    $shortcutLocation = Join-Path -Path $startupFolder -ChildPath "$($_.BaseName)_ahkstartup.lnk"
    $Shortcut = $WshShell.CreateShortcut($shortcutLocation)
    $Shortcut.TargetPath = $_.FullName
    $Shortcut.Save()
}

ii $startupFolder