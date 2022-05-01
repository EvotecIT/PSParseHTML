Import-Module .\PSParseHTML.psd1 -Force

<#
$URL = "https://www.dailydairyreport.com"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLAttributes -Content $HTML -Class 'banner-text-info'

$URL = "https://www.kintai-driver.com/"
$html = (Invoke-WebRequest -Uri $UrL).Content

ConvertFrom-HTMLAttributes -Content $HTML -Class 'phone-contact'
#>

<#
$URL = "https://www.remotespark.com/view/new.html"
$html = (Invoke-WebRequest -Uri $UrL).Content

$Output = ConvertFrom-HTMLAttributes -Content $HTML -Tag 'article' -ReturnObject
foreach ($O in $Output) {
    $Header = ConvertFrom-HTMLAttributes -Content $O.InnerHtml -Tag 'header'
    $List = ConvertFrom-HTMLAttributes -Content $O.InnerHtml -Tag 'ol'
    $List
}
#>