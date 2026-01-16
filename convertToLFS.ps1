# Script to convert logo.paa back to a Git LFS object

# Track *.paa files with Git LFS
git lfs track "*.paa"

if($LASTEXITCODE -ne 0)
{
	Write-Error "Failed to track *.paa with Git LFS"
	Pause
	exit $LASTEXITCODE
}

# Re-add logo.paa so it gets converted to LFS
git rm --cached logo.paa

if($LASTEXITCODE -ne 0)
{
	Write-Error "Failed to remove logo.paa from cache"
	Pause
	exit $LASTEXITCODE
}

git add logo.paa

if($LASTEXITCODE -ne 0)
{
	Write-Error "Failed to add logo.paa to Git LFS"
	Pause
	exit $LASTEXITCODE
}

Write-Output "logo.paa has been converted to a Git LFS object"
Write-Output "Don't forget to commit the changes (.gitattributes and logo.paa)"
Pause
exit 0
