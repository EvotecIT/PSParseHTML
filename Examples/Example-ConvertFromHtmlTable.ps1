
Import-Module .\PSParseHTML.psd1 -Force

$html = (Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/PowerShell').Content
$tmp = ConvertFrom-HtmlTable -Content $html

# If converting multiple tables, the output will look funky
# since it is creating an array of different objects.
$tmp[0] | Format-Table -AutoSize
$tmp[1] | Format-Table -AutoSize
$tmp[2] | Format-Table -AutoSize
$tmp[3] | Format-Table -AutoSize
$tmp[4] | Format-Table -AutoSize
# ... etc
