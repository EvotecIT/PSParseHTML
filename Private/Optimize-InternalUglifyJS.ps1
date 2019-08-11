function Optimize-InternalUglifyJS {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    [NUglify.Uglify]::Js($Content).Code
}