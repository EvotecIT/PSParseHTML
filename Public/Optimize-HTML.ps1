function Optimize-HTML {
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile,
        [string] $Content
    )
    # Load from file or text
    if ($File) {
        if (Test-Path -LiteralPath $File) {
            $Content = [IO.File]::ReadAllText($File)
        } else {
            Write-Warning "Optimize-HTML - File doesn't exists"
            return
        }
    } elseif ($Content) {

    } else {
        Write-Warning 'Optimize-HTML - No choice file or Content. Termninated.'
        return
    }

    # for now don't want to give this as option
    [bool] $ShouldKeepAttributeQuotes = $true
    [bool] $ShouldKeepComments = $true
    [bool] $ShouldKeepEmptyAttributes = $true
    [bool] $ShouldKeepImpliedEndTag = $true
    [bool] $ShouldKeepStandardElements = $true

    # Do magic
    #$Output = Optimize-InternalHTML -Content $Content -ShouldKeepAttributeQuotes $ShouldKeepAttributeQuotes -ShouldKeepComments $ShouldKeepComments -ShouldKeepEmptyAttributes $ShouldKeepEmptyAttributes -ShouldKeepImpliedEndTag $ShouldKeepImpliedEndTag -ShouldKeepStandardElements $ShouldKeepStandardElements
    $Output = Optimize-InternalUglifyHTML -Content $Content


    # Output to file or to text
    if ($OutputFile) {
        [IO.File]::WriteAllText($OutputFile, $Output)
    } else {
        $Output
    }
}