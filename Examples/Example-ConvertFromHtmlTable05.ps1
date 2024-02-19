Clear-Host
Import-Module .\PSParseHTML.psd1 -Force

$AllTables = ConvertFrom-HtmlTable -Url 'https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/licensing-service-plan-reference'
# There are 9 tables
$AllTables[0] | Format-Table

[string] $Licenses = @(
    "   `$O365SKU = @{" + [System.Environment]::NewLine
    # we only want the first one right?
    foreach ($L in $AllTables[0]) {
        -join ("        ", "`"$($L.'String ID')`"", ' = ', "`"$($L.'Product name')`"", [System.Environment]::NewLine)
    }
    "   }"
)
$Licenses