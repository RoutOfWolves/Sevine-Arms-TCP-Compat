param (
	[switch]$CI
)

if (-not $CI) {
	# get user to edit changelog
	Write-Host "Please edit the changelog.md file and save your changes."
	if ($IsWindows -or [System.Environment]::OSVersion.Platform -eq "Win32NT") {
		Start-Process "changelog.md"
	} elseif ($IsLinux -or $IsMacOS -or [System.Environment]::OSVersion.Platform -eq "Unix") {
		Start-Process "xdg-open" "changelog.md"
	} else {
		Write-Host "Unsupported OS. Please manually open changelog.md in your preferred text editor."
	}
	Read-Host "Press Enter to continue after saving the changelog."
}

# extract new version number from changelog.md
$changelogContent = Get-Content "changelog.md"

# Check if the Unreleased section is empty or contains only blank lines
$matchFound = ($changelogContent -join "`n") -match "(?s)(?<=## Unreleased`n).*?(?=## \d+\.\d+\.\d+|$)"
$unreleasedSectionContent = ""

if (-not $matchFound)
{
	Write-Warning "No '## Unreleased' section found in changelog.md. Assuming it's empty."
}
else
{
	$unreleasedSectionContent = $matches[0] -replace "`n", "" -replace "`r", ""
}

if ($unreleasedSectionContent -and $unreleasedSectionContent -notmatch "^\s*$") {
	Write-Error "The '## Unreleased' section in changelog.md must be empty or contain only blank lines. Please move the changes to a new version section."
	If ($CI){
		Write-Debug "Unreleased section content: '$unreleasedSectionContent'"
	}
	exit 1
}
$newVersionLine = $changelogContent | Select-String -Pattern "^## \d+\.\d+\.\d+" | Select-Object -First 1

if ($null -eq $newVersionLine) {
	if ($CI) {
		Write-Error "Could not find a version number in changelog.md and cannot prompt for input in CI mode."
		exit 1
	} else {
		Write-Host "Could not find a version number in changelog.md. Please enter the new version number (e.g., 0.27.0):"
		$newVersion = Read-Host
	}
} else {
	$newVersion = $newVersionLine -replace "## ", ""
}

# split version number into major, minor, and patch
$versionParts = $newVersion -split "\."
$major = $versionParts[0]
$minor = $versionParts[1]
$patch = $versionParts[2]
$build = (Get-Date).ToString("yyyyMMdd")

# update version in script_version.hpp
$scriptVersionPath = "addons/core/script_version.hpp"
$scriptVersionContent = Get-Content $scriptVersionPath
$scriptVersionContent = $scriptVersionContent -replace "(?<=#define MAJOR )\d+", $major
$scriptVersionContent = $scriptVersionContent -replace "(?<=#define MINOR )\d+", $minor
$scriptVersionContent = $scriptVersionContent -replace "(?<=#define PATCH )\d+", $patch
$scriptVersionContent = $scriptVersionContent -replace "(?<=#define BUILD )\d+", $build
Set-Content -Path $scriptVersionPath -Value $scriptVersionContent

Write-Output "Updated script_version.hpp to version $newVersion."
exit 0
