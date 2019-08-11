function Convert-HTMLToText {
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
            Write-Warning "Convert-HTMLToText - File doesn't exists"
            return
        }
    } elseif ($Content) {

    } else {
        Write-Warning 'Convert-HTMLToText - No choice file or Content. Termninated.'
        return
    }

    $Output = Format-InternalCSS -Content $Content

    # Output to file or to text
    if ($OutputFile) {
        [IO.File]::WriteAllText($OutputFile, $Output)
    } else {
        $Output
    }
}