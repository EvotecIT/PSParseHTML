Import-Module .\PSParseHTML.psd1 -Force

$URL = "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLTag -Content $HTML -Tag 'em'