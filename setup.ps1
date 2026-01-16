# Setup script that enables GitHub workflows and converts to LFS

Write-Output "Running setup..."
Write-Output ""

# Enable workflows
Write-Output "Step 1: Enabling GitHub workflows..."
& "$PSScriptRoot/enableWorkflows.ps1"
if ($LASTEXITCODE -ne 0) {
	Write-Error "enableWorkflows.ps1 failed, aborting setup."
	Read-Host -Prompt "Press Enter to continue"
	exit $LASTEXITCODE
}

Write-Output ""

# Convert to LFS
Write-Output "Step 2: Converting to Git LFS..."
& "$PSScriptRoot/convertToLFS.ps1"
if ($LASTEXITCODE -ne 0) {
	Write-Error "convertToLFS.ps1 failed, aborting setup."
	Read-Host -Prompt "Press Enter to continue"
	exit $LASTEXITCODE
}

Write-Output ""
Write-Output "Setup complete!"
Write-Output "Don't forget to commit the changes."
Read-Host -Prompt "Press Enter to continue"
exit 0
