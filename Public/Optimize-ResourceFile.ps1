function Optimize-ResourceFile {
    [alias('New-MinifiFile','New-MinifyFile')]
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile
    )
    if ($File -and (Test-Path -LiteralPath $File)) {
        $FileContent = [IO.File]::ReadAllText($file)
        try {
            $cssCompressor = New-Object -TypeName Yahoo.Yui.Compressor.CssCompressor
            $CompressedContent = $cssCompressor.Compress($FileContent)
        } catch {

        }
        if ($CompressedContent) {
            [IO.File]::WriteAllText($OutputFile, $CompressedContent)
        }
    }
}