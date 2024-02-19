

$Objects = ConvertFrom-HTMLAttributes -Url 'https://evotec.xyz' -Tag 'meta' -ReturnObject
foreach ($O in $Objects) {
    [PSCUstomObject] @{
        name    = $O.name
        content = $O.content
        comment = $O.comment
    }
}