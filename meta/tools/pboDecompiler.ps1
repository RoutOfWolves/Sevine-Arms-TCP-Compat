$overwriteExistingFolders = $false
$removePbos = $false

# Tool paths - change these as needed
$pboConsolePath = "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" # https://www.moddb.com/mods/pbo-manager/downloads/pbo-manager-v14
$cfgConvertPath = "C:\Games\Steam\steamapps\common\Arma 3 Tools\CfgConvert\CfgConvert.exe" # https://store.steampowered.com/app/233800/Arma_3_Tools/
$cfgConvertFileChangePath = "C:\Games\Steam\steamapps\common\Arma 3 Tools\CfgConvertFilechng\CfgConvertFileChange.exe" # https://store.steampowered.com/app/233800/Arma_3_Tools/

$pbos = Get-ChildItem *.pbo -Recurse
foreach ($pbo in $pbos){
	$destination = Join-Path $pbo.DirectoryName ($pbo.BaseName)
	Write-Output $pbo
	if(Test-Path($destination)){
		if($overwriteExistingFolders){
			Write-Output " Found existing, deleting"
			Remove-Item $destination -Recurse -Force
		}
		else{
			Write-Output " Found existing, skipping"
			continue
		}
	}
	& "$pboConsolePath"  -unpack $pbo $destination | out-null
	if($removePbos)
	{
		Remove-Item $pbo -Force
	}
}

$configs = Get-ChildItem *.bin -Recurse
foreach ($configBinPath in $configs){
	$configCppPath = Join-Path $configBinPath.DirectoryName ($configBinPath.BaseName + ".cpp")
	Write-Output $configCppPath
	if(Test-Path($configCppPath)){
		# We already deleted the PBO folder so we can only skip
		Write-Output " Found existing, skipping"
		continue
	}
	& "$cfgConvertPath" -dst $configCppPath $configBinPath | out-null
}

$materials = Get-ChildItem *.rvmat -Recurse
foreach ($rvmatPath in $materials){
	Write-Output $rvmatPath
	& "$cfgConvertFileChangePath" $rvmatPath | out-null
}
