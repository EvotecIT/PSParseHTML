Import-Module .\PSParseHTML.psd1 -Force

$Url = 'https://learn.microsoft.com/en-us/officeupdates/update-history-microsoft365-apps-by-date#version-history'

$AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AgilityPack
$AllTables.Count
$AllTables[0] | Format-Table
$AllTables[1] | Format-Table