function Optimize-InternalUglifyCSS {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    [NUglify.Uglify]::Css($Content).Code
}