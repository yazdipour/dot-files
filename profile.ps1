#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#New-Item $profile -Type File -Force
#notepad $profile
#function AsAdminOrNot {
#	$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
#	$prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
#	$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
#	$prp.IsInRole($adm)
#}

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Agnoster

function turn-on-hotspot { netsh wla start ho}
function turn-off-hotspot { netsh wla stop ho}
function p1 {ping 1.1.1.1 -t}
function p192 {ping 192.168.1.1 -t}
function adblog($_) {ADB logcat $_}
function adbloge($_) {ADB logcat *:E}
function adbconnect($_) {ADB connect $_}
function adbemulator($_) {cd $env:android_home/tools/ ; emulator.exe -avd $_}
function run-as-admin{Start-Process powershell -Verb runas}
function clean-bin{Get-ChildItem .\ -include bin,obj -Recurse | ForEach-Object ($_) { remove-item $_.fullname -Force -Recurse }}
function update-fork($_){git remote add upstream $_ ; git fetch upstream ; git pull upstream master}
function updatep {. $profile}
function editp {nano $profile}
function cr($_){code $_ -r}
function gitm($_){git commit -m $_}
function gitc($_){git clone $_}
function gita($_){git add $_}
function gitp($_){git push $_}
function gitd($_){git diff $_}
function git-noupdate($_){git update-index --assume-unchanged $_}
function gitrm($_){git rm --cached $_}
function gits(){git status}
#######
Set-Alias w turn-on-hotspot
Set-Alias w! turn-off-hotspot
Set-Alias c code
Set-Alias e explorer
Set-Alias su run-as-admin
Set-Alias g git
Set-Alias l ls
Set-Alias w3m elinks
Set-Alias bget Start-BitsTransfer
$repo= Join-Path $env:USERPROFILE -ChildPath \Documents\Repos\_MINE\
$dl= Join-Path $env:USERPROFILE -ChildPath \Downloads\

#######
#if (AsAdminOrNot) {Write-Output "~Admin~Be careful!"}
#else {Write-Output "~NotAdmin~"}
#Start-Transcript
