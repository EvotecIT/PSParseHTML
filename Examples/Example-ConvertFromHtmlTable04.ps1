
Import-Module .\PSParseHTML.psd1 -Force

# Alternatively
$Tables = ConvertFrom-HtmlTable -Content (Get-Content -LiteralPath "$PSScriptRoot\Input\DashboardEasy01.html" -Raw)
# If converting multiple tables, the output will look funky
# since it is creating an array of different objects.
$Tables[0] | Format-Table #-Property ChildNodes,InnerHtml, Line
$Tables[1] | Format-Table #-Property ChildNodes,InnerHtml, Line
# ... etc