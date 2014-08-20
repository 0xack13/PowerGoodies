function Get-WirelessAutoProfile
{
$GUID = (Get-NetAdapter -Name 'wi-fi').interfaceGUID

$path = "C:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces\$guid"

Get-ChildItem -Path $path -Recurse |

Foreach-Object {

   [xml]$c = Get-Content -path $_.fullname

   New-Object pscustomobject -Property @{

   'name' = $c.WLANProfile.name;

   'mode' = $c.WLANProfile.connectionMode;

   'ssid' = $c.WLANProfile.SSIDConfig.SSID.hex} 
   }
 }

 Get-WirelessAutoProfile