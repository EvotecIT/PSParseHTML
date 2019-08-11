$PSVersionTable.PSVersion

$ModuleName = (Get-ChildItem $PSScriptRoot\*.psd1).BaseName

$Pester = (Get-Module -ListAvailable pester)
if ($null -eq $Pester -or ($Pester[0].Version.Major -le 4 -and $Pester[0].Version.Minor -lt 4)) {
    Write-Warning "$ModuleName - Downloading Pester from PSGallery"
    Install-Module -Name Pester -Repository PSGallery -Force -SkipPublisherCheck -Scope CurrentUser
}

$result = Invoke-Pester -Script $PSScriptRoot\Tests -EnableExit

if ($result.FailedCount -gt 0) {
    throw "$($result.FailedCount) tests failed."
}