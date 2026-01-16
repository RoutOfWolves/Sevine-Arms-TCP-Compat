& "$PSScriptRoot/prepRelease.ps1"
if ($LASTEXITCODE -ne 0) {
	Write-Error "prepRelease.ps1 failed, aborting release."
	Pause
	exit $LASTEXITCODE
}

if(Test-Path "./meta/tools/hemtt/hemtt.exe")
{
	./meta/tools/hemtt/hemtt.exe release
}
else
{
	hemtt release
}

if($LASTEXITCODE -eq 0)
{
	Write-Output "Release built"
	Pause
	exit $LASTEXITCODE
}
else
{
	Write-Error "Failed to build release, see HEMTT output for details"
	Pause
	exit $LASTEXITCODE
}
