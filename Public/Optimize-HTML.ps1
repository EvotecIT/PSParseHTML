function Optimize-HTML {
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile
    )
    if ($File -and (Test-Path -LiteralPath $File)) {
        $FileContent = [IO.File]::ReadAllText($file)

        $HTMLParser = New-Object -TypeName AngleSharp.Html.Parser.HtmlParser
        $ParsedDocument = $HTMLParser.ParseDocument($FileContent)
        $StringWriter = [System.IO.StringWriter]::new()
        $PrettyMarkupFormatter = New-Object -TypeName AngleSharp.Html.MinifyMarkupFormatter
        $ParsedDocument.ToHtml($StringWriter, $PrettyMarkupFormatter)
        #$ParsedDocument.StyleSheets

        $FormattedHTML = $StringWriter.ToString()

        if ($FormattedHTML) {
            [IO.File]::WriteAllText($OutputFile, $FormattedHTML)
        }
    }
}