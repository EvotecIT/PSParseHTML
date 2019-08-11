function Optimize-InternalCSS {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    $CSSParser = [AngleSharp.Css.Parser.CssParser]::new()
    $ParsedDocument = $CSSParser.ParseStyleSheet($Content)
    $StringWriter = [System.IO.StringWriter]::new()
    $PrettyMarkupFormatter = [AngleSharp.Css.MinifyStyleFormatter]::new()
    $ParsedDocument.ToCss($StringWriter, $PrettyMarkupFormatter)
    $StringWriter.ToString()
}