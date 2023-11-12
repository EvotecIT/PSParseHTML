Import-Module .\PSParseHTML.psd1 -Force

# Method to extract special case tables
#$Tables1 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw' -ReverseTable
#$Tables2 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw'
#$Tables1
#$Tables2

$URL = 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw'
$html = (Invoke-WebRequest -Uri $UrL).Content
#$HTML = ConvertFrom-HTML -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw'
#$HTML = ConvertFrom-HTML -Content $html
ConvertFrom-HtmlTable -Content $HTML -ReverseTable
$Tables1 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw' -ReverseTable
$Tables2 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw'
$Tables3 = ConvertFrom-HtmlTable -Content $HTML -ReverseTable
$Tables4 = ConvertFrom-HtmlTable -Content $HTML

$Tables1.Count
$Tables2.Count
$Tables3.Count
$Tables4.Count