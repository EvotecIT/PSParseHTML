function Optimize-ResourceFolder {
    [alias('New-MinifiFolder', 'New-MinifyFolder')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)][string]$Folder,
        [string[]] $Include = @('*.js', '.css')
    )
    $Files = Get-ChildItem -LiteralPath $Folder -Recurse -Force -Include $Include
    foreach ($File in $Files) {
        New-MinifyFile -File $File.FullName -OutputFile $File.FullName
    }
}