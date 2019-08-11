function Optimize-InternalUglifyHTML {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    [NUglify.Uglify]::Html($Content).Code
}