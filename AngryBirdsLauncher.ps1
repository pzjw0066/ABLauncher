$AppPath = Get-ChildItem -Path (get-location) -Recurse -Include "AngryBirds.exe" -Name
if ((Test-Path -Path "${PSScriptRoot}\Angry Birds Saves")){
    Copy-Item -Path "${PSScriptRoot}\Angry Birds Saves\*.lua" -Destination "${Home}\AppData\Roaming\Rovio\Angry Birds" -Recurse
}
$AppProcess = Start-Process -FilePath $AppPath -PassThru
$AppProcess.WaitForExit()
if (-not(Test-Path -Path "${PSScriptRoot}\Angry Birds Saves")){
    New-Item -Path "${PSScriptRoot}\Angry Birds Saves" -ItemType Directory
}
Copy-Item -Path "${Home}\AppData\Roaming\Rovio\Angry Birds\*.lua" -Destination "${PSScriptRoot}\Angry Birds Saves" -Recurse
