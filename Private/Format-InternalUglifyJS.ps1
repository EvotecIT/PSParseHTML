function Format-InternalUglifyJS {
    [CmdletBinding()]
    param(
        [string] $Content
    )
    $Settings = [NUglify.JavaScript.CodeSettings]::new()
    $Settings.MinifyCode = $true
    $Settings.OutputMode = [NUglify.OutputMode]::MultipleLines
    $Settings.Indent = $Indent
    $Settings.LocalRenaming = [NUglify.JavaScript.LocalRenaming]::KeepAll
    #$Settings.EvalTreatment = [NUglify.JavaScript.EvalTreatment]::Ignore
    #$Settings.Format = [NUglify.JavaScript.JavaScriptFormat]::Normal
    $Settings.Indent = '    '
    $Settings.NoAutoRenameList = $true
    $Settings.PreserveFunctionNames = $true
    # $Settings.NoAutoRenameCollection  # ReadOnly
    [NUglify.Uglify]::Js($Content, $Code).Code
}