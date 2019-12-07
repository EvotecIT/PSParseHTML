Import-Module .\PSParseHTML.psd1 -Force

$URL = "https://www.dailydairyreport.com"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLTag -Content $HTML -Tag 'h3'