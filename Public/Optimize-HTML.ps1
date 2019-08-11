function Optimize-HTML {
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile,
        [string] $Content,
        [bool] $ShouldKeepAttributeQuotes = $true,
        [bool] $ShouldKeepComments = $true,
        [bool] $ShouldKeepEmptyAttributes = $true,
        [bool] $ShouldKeepImpliedEndTag = $true,
        [bool] $ShouldKeepStandardElements = $true
    )
    # Load from file or text
    if ($File) {
        if (Test-Path -LiteralPath $File) {
            $Content = [IO.File]::ReadAllText($File)
        } else {
            Write-Warning 'Optimize-JavaScript - File doesnt exists'
            return
        }
    } elseif ($Content) {

    } else {
        Write-Warning 'Optimize-JavaScript - No choice file or Content. Termninated.'
        return
    }

    # Do magic
    $Output = Optimize-InternalHTML -Content $Content -ShouldKeepAttributeQuotes $ShouldKeepAttributeQuotes -ShouldKeepComments $ShouldKeepComments -ShouldKeepEmptyAttributes $ShouldKeepEmptyAttributes -ShouldKeepImpliedEndTag $ShouldKeepImpliedEndTag -ShouldKeepStandardElements $ShouldKeepStandardElements

    # Output to file or to text
    if ($OutputFile) {
        [IO.File]::WriteAllText($OutputFile, $Output)
    } else {
        $Output
    }
}

