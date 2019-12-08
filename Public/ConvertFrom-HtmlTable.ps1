Function ConvertFrom-HtmlTable {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Content')][string]$Content,
        [alias('Uri')][Parameter(Mandatory = $true, ParameterSetName = 'Uri')][Uri] $Url,
        [System.Collections.IDictionary] $ReplaceContent,
        [System.Collections.IDictionary] $ReplaceHeaders,
        [ValidateSet('AngleSharp', 'AgilityPack')] $Engine
    )
    Begin {
        # This fixes an issue https://github.com/PowerShell/PowerShell/issues/11287 for ConvertTo-HTML
        $HeadersReplacement = [ordered] @{ '\*' = ''; }
        if (-not $ReplaceHeaders) {
            $ReplaceHeaders = [ordered] @{ }
        }
        foreach ($Key in $HeadersReplacement.Keys) {
            $ReplaceHeaders["$Key"] = $HeadersReplacement.$Key
        }
    }
    Process {
        if ($Engine -eq 'AngleSharp') {
            ConvertFrom-HTMLTableAngle -Url $Url -Content $Content -ReplaceHeaders $ReplaceHeaders -ReplaceContent $ReplaceContent
        } else {
            ConvertFrom-HTMLTableAgilityPack -Url $url -Content $Content -ReplaceHeaders $ReplaceHeaders -ReplaceContent $ReplaceContent
        }
    }
    End { }
}