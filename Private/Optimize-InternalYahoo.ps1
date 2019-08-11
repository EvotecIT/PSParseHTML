function Optimize-InternalYahoo {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    # Optimizes both JS and CSS
    $cssCompressor = [Yahoo.Yui.Compressor.CssCompressor]::new()
    $CompressedContent = $cssCompressor.Compress($Content)
    $CompressedContent
}