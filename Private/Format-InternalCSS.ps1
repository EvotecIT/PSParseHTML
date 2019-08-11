function Format-InternalCSS {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    <#
       $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    $ParsedDocument = $HTMLParser.ParseDocument($Content)
    $StringWriter = [System.IO.StringWriter]::new()
    $PrettyMarkupFormatter = [AngleSharp.Html.PrettyMarkupFormatter]::new()
    $ParsedDocument.ToHtml($StringWriter, $PrettyMarkupFormatter)
    $StringWriter.ToString()
    #>
    $CssParser = [AngleSharp.Css.Parser.CssParser]::new()
    $ParsedDocument = $CssParser.ParseStyleSheet($Content)
    $StringWriter = [System.IO.StringWriter]::new()
    $PrettyMarkupFormatter = [AngleSharp.Css.CssStyleFormatter]::new()
    $ParsedDocument.ToCss($StringWriter, $PrettyMarkupFormatter)
    $StringWriter.ToString()
}