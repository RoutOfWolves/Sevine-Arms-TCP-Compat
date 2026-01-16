if(Test-Path "./meta/tools/hemtt/hemtt.exe")
{
	./meta/tools/hemtt/hemtt.exe check
}
else
{
	hemtt check
}

if($LASTEXITCODE -eq 0)
{
	Write-Output "Check passed"
	Pause
	exit $LASTEXITCODE
}
else
{
	Write-Error "Check failed, see HEMTT output for details"
	Pause
	exit $LASTEXITCODE
}
