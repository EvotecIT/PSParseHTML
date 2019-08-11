function Optimize-InternalUglifyHTML {
    [CmdletBinding()]
    param(
        [string] $Content
    )

    $Settings = [NUglify.Html.HtmlSettings]::new()
    $Settings.RemoveOptionalTags = $false

    [NUglify.Uglify]::Html($HTMLContentFormatted, $Settings).Code
}