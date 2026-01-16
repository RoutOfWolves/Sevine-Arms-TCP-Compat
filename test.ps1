if(Test-Path "./meta/tools/hemtt/hemtt.exe")
{
	./meta/tools/hemtt/hemtt.exe launch
}
else
{
	hemtt launch
}

if($LASTEXITCODE -eq 0)
{
	Write-Output "Build successful"
	Pause
	exit $LASTEXITCODE
}
else
{
	Write-Error "Build failed, see HEMTT output for details"
	Pause
	exit $LASTEXITCODE
}
