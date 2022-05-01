@{
    AliasesToExport      = @('ConvertFrom-HTMLTag', 'ConvertFrom-HTMLClass', 'Format-JS')
    Author               = 'Przemyslaw Klys'
    CmdletsToExport      = @()
    CompanyName          = 'Evotec'
    CompatiblePSEditions = @('Desktop', 'Core')
    Copyright            = '(c) Przemyslaw Klys. All rights reserved.'
    Description          = 'Module that allows to manipulate, parse, format and optimize HTML, JavaScript and CSS'
    FunctionsToExport    = @('Convert-HTMLToText', 'ConvertFrom-HTML', 'ConvertFrom-HTMLAttributes', 'ConvertFrom-HtmlTable', 'Format-CSS', 'Format-HTML', 'Format-JavaScript', 'Optimize-CSS', 'Optimize-HTML', 'Optimize-JavaScript')
    GUID                 = 'f0387960-7034-4918-a1e1-d5847cbf90df'
    ModuleVersion        = '0.0.21'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            Tags       = @('HTML', 'WWW', 'JavaScript', 'CSS', 'Windows', 'MacOS', 'Linux')
            ProjectUri = 'https://github.com/EvotecIT/PSParseHTML'
            IconUri    = 'https://evotec.xyz/wp-content/uploads/2018/12/PSWriteHTML.png'
        }
    }
    RootModule           = 'PSParseHTML.psm1'
}