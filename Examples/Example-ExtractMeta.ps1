Import-Module .\PSParseHTML.psd1 -Force

$File = 'C:\Support\GitHub\ADDashboard\Ignore\Reports\Report.html'
$Objects = ConvertFrom-HTMLAttributes -Content (Get-Content -Raw $File) -Tag 'meta' -ReturnObject
foreach ($O in $Objects) {
    [PSCUstomObject] @{
        name    = $O.name
        content = $O.content
        comment = $O.comment
    }
}


$Objects = ConvertFrom-HTMLAttributes -Content (Get-Content -Raw $File) -Tag 'style' -ReturnObject
foreach ($O in $Objects) {
    [PSCUstomObject] @{
        name    = $O.name
        content = $O.content
        comment = $O.comment
    }
}