
Import-Module .\PSParseHTML.psd1 -Force

$URL = "https://www.dailydairyreport.com"
$html = (Invoke-WebRequest -Uri $UrL).Content
$tmp = ConvertFrom-HtmlTable -Content $html -Verbose
$tmp[0] | Format-Table
$tmp[1] | Format-Table
$tmp[2] | Format-Table