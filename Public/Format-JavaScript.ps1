function Format-JavaScript {
    [alias('Format-JS')]
    [CmdletBinding()]
    param(
        [string] $File,
        [string] $OutputFile,
        [alias('FileContent')][string] $Content,
        [int] $IndentSize = 4,
        [string] $IndentChar = ' ',
        [bool] $IndentWithTabs = $false,
        [bool] $PreserveNewlines = $true,
        [double] $MaxPreserveNewlines = 10.0,
        [bool] $JslintHappy = $false,
        [Jsbeautifier.BraceStyle] $BraceStyle = [Jsbeautifier.BraceStyle]::Collapse,
        [bool] $KeepArrayIndentation = $false,
        [bool] $KeepFunctionIndentation = $false,
        [bool] $EvalCode = $false,
        [int] $WrapLineLength = 0,
        [bool] $BreakChainedMethods = $false
    )
    # Load from file or text
    if ($File) {
        if (Test-Path -LiteralPath $File) {
            $Content = [IO.File]::ReadAllText($File)
        } else {
            Write-Warning 'Format-JavaScript - File doesnt exists'
            return
        }
    } elseif ($Content) {

    } else {
        Write-Warning 'Format-JavaScript - No choice file or Content. Termninated.'
        return
    }

    # do the magic
    $SplatJS = @{
        IndentSize              = $IndentSize
        IndentChar              = $IndentChar
        IndentWithTabs          = $IndentWithTabs
        PreserveNewlines        = $PreserveNewlines
        MaxPreserveNewlines     = $MaxPreserveNewlines
        JslintHappy             = $JslintHappy
        BraceStyle              = $BraceStyle
        KeepArrayIndentation    = $KeepArrayIndentation
        KeepFunctionIndentation = $KeepFunctionIndentation
        EvalCode                = $EvalCode
        WrapLineLength          = $WrapLineLength
        BreakChainedMethods     = $BreakChainedMethods
    }

    $Output = Format-InternalJS -Content $Content @SplatJS

    # Output to file or to text
    if ($OutputFile) {
        [IO.File]::WriteAllText($OutputFile, $Output)
    } else {
        $Output
    }
}