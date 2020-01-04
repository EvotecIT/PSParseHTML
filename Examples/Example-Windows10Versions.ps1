Import-Module PSParseHTML

$Tables = ConvertFrom-HtmlTable -Url 'https://winreleaseinfoprod.blob.core.windows.net/winreleaseinfoprod/en-US.html'
$Tables[0] | Format-Table
$Tables[1] | Format-Table
