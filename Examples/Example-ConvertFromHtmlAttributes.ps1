Import-Module .\PSParseHTML.psd1 -Force

$URL = "https://www.dailydairyreport.com"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLAttributes -Content $HTML -Class 'banner-text-info'

$URL = "https://www.kintai-driver.com/"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLAttributes -Content $HTML -Class 'phone-contact'