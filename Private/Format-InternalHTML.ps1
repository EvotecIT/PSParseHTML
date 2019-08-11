function Format-InternalHTML {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    $ParsedDocument = $HTMLParser.ParseDocument($Content)
    $StringWriter = [System.IO.StringWriter]::new()
    $PrettyMarkupFormatter = [AngleSharp.Html.PrettyMarkupFormatter]::new()
    $ParsedDocument.ToHtml($StringWriter, $PrettyMarkupFormatter)
    $StringWriter.ToString()
}