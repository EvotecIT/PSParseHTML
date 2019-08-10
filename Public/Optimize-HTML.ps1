function Optimize-HTML {
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile,
        [switch] $ShouldKeepAttributeQuotes,
        [switch] $ShouldKeepComments,
        [switch] $ShouldKeepEmptyAttributes,
        [switch] $ShouldKeepImpliedEndTag,
        [switch] $ShouldKeepStandardElements
    )
    if ($File -and (Test-Path -LiteralPath $File)) {
        $FileContent = [IO.File]::ReadAllText($file)

        $HTMLParser = New-Object -TypeName AngleSharp.Html.Parser.HtmlParser
        $ParsedDocument = $HTMLParser.ParseDocument($FileContent)
        $StringWriter = [System.IO.StringWriter]::new()
        $MinifyMarkupFormatter = New-Object -TypeName AngleSharp.Html.MinifyMarkupFormatter
        $ParsedDocument.ToHtml($StringWriter, $MinifyMarkupFormatter)
        $MinifyMarkupFormatter.ShouldKeepAttributeQuotes = $ShouldKeepAttributeQuotes
        $MinifyMarkupFormatter.ShouldKeepComments = $ShouldKeepComments
        $MinifyMarkupFormatter.ShouldKeepEmptyAttributes = $ShouldKeepEmptyAttributes
        $MinifyMarkupFormatter.ShouldKeepImpliedEndTag = $ShouldKeepImpliedEndTag
        $MinifyMarkupFormatter.ShouldKeepStandardElements = $ShouldKeepStandardElements

        $FormattedHTML = $StringWriter.ToString()

        if ($FormattedHTML) {
            [IO.File]::WriteAllText($OutputFile, $FormattedHTML)
        }
    }
}

