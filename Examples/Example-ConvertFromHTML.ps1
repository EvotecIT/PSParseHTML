Import-Module .\PSParseHTML.psd1 -Force

# Option 1 - uses Agility Pack
$PageHTMLUrl = ConvertFrom-HTML -URL "https://www.evotec.xyz"
$PageHTMLUrl

# Option 1 - uses Agility Pack
$PageHTML = ConvertFrom-HTML -Content "<html><body><p>Test</p></body></html>"
$PageHTML

# Option 2 - uses AngleSharp
$PageHTMLUrl2 = ConvertFrom-HTML -URL "https://www.evotec.xyz" -Engine AngleSharp
$PageHTMLUrl2