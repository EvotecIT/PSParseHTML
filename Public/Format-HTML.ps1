function Format-HTML {
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
            Write-Warning "Format-HTML - File doesn't exists"
            return
        }
    } elseif ($Content) {

    } else {
        Write-Warning 'Format-HTML - No choice file or Content. Termninated.'
        return
    }

    # Do the magic
    $Output = Format-InternalHTML -Content $Content

    # Output to file or to text
    if ($OutputFile) {
        [IO.File]::WriteAllText($OutputFile, $Output)
    } else {
        $Output
    }
}