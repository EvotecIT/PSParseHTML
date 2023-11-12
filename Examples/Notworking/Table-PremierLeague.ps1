Import-Module .\PSParseHTML.psd1 -Force

$Test = ConvertFrom-HtmlTable -Url 'https://www.goal.com/en-us/premier-league/table/2kwbbcootiqqgmrzs6o5inle5'
$Test | Format-Table -AutoSize *


$Test = ConvertFrom-HtmlTable -Url 'https://www.goal.com/en-us/premier-league/table/2kwbbcootiqqgmrzs6o5inle5' -Engine AngleSharp
$Test | Format-Table -AutoSize *