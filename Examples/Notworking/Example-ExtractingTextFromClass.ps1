Import-Module .\PSParseHTML.psd1 -Force

$PageHTMLUrl2 = ConvertFrom-HTMLTag -Url "https://portal.assessor.lacounty.gov/parceldetail/5130020021" -Tag address
$PageHTMLUrl2