Import-Module .\PSParseHTML.psd1 -Force

# Method to extract special case tables
$Tables1 = ConvertFrom-HtmlTable -Url 'https://en.wikipedia.org/wiki/PowerShell' -ReverseTable
$Tables2 = ConvertFrom-HtmlTable -Url 'https://en.wikipedia.org/wiki/PowerShell'

New-HTML {
    New-HTMLTab -Name 'Reverse Table' {
        foreach ($Table in $Tables1) {
            New-HTMLTable -DataTable $Table -Filtering
        }
    }
    New-HTMLTab -Name 'Non-Reverse Table' {
        foreach ($Table in $Tables2) {
            New-HTMLTable -DataTable $Table -Filtering
        }
    }
} -FilePath "$PSScriptRoot\Output\Example.Wikipedia.html" -ShowHTML -Online