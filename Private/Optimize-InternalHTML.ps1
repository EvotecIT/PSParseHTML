function Optimize-InternalHTML {
    [CmdletBinding()]
    param(
        [string] $Content,
        [bool] $ShouldKeepAttributeQuotes,
        [bool] $ShouldKeepComments,
        [bool] $ShouldKeepEmptyAttributes,
        [bool] $ShouldKeepImpliedEndTag,
        [bool] $ShouldKeepStandardElements
    )
    $StringWriter = [System.IO.StringWriter]::new()

    $MinifyMarkupFormatter = [AngleSharp.Html.MinifyMarkupFormatter]::new()
    $MinifyMarkupFormatter.ShouldKeepAttributeQuotes = $ShouldKeepAttributeQuotes
    $MinifyMarkupFormatter.ShouldKeepComments = $ShouldKeepComments
    $MinifyMarkupFormatter.ShouldKeepEmptyAttributes = $ShouldKeepEmptyAttributes
    $MinifyMarkupFormatter.ShouldKeepImpliedEndTag = $ShouldKeepImpliedEndTag
    $MinifyMarkupFormatter.ShouldKeepStandardElements = $ShouldKeepStandardElements

    $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    $ParsedDocument = $HTMLParser.ParseDocument($Content)
    $ParsedDocument.ToHtml($StringWriter, $MinifyMarkupFormatter)
    $StringWriter.ToString()
}