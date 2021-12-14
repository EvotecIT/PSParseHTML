Import-Module .\PSParseHTML.psd1 -Force

# Option 1 - uses Agility Pack
$PageHTML = ConvertFrom-HTML -URL "https://www.evotec.xyz"
$PageHTML

# Option 2 - uses AngleSharp
$PageHTML = ConvertFrom-HTML -URL "https://www.evotec.xyz" -Engine AngleSharp
$PageHTML