$html = (Invoke-WebRequest -Uri 'https://en.wikipedia.org/wiki/PowerShell').Content
$tmp = ConvertFrom-HtmlTable -Content $html

# If converting multiple tables, the output will look funky
# since it is creating an array of different objects.
$tmp[0]
$tmp[1]

# ... etc