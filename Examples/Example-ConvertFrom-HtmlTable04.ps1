Import-Module .\PSParseHTML.psd1 -Force

# Method to extract special case tables
$Tables1 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw' -ReverseTable
$Tables2 = ConvertFrom-HtmlTable -Url 'https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw'

$Tables1

$Tables2