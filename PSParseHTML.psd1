﻿@{
    AliasesToExport        = @('ConvertFrom-HTMLTag', 'ConvertFrom-HTMLClass', 'Format-JS')
    Author                 = 'Przemyslaw Klys'
    CmdletsToExport        = @()
    CompanyName            = 'Evotec'
    CompatiblePSEditions   = @('Desktop', 'Core')
    Copyright              = '(c) Przemyslaw Klys. All rights reserved.'
    Description            = 'Module that allows to manipulate, parse, format and optimize HTML, JavaScript and CSS'
    DotNetFrameworkVersion = '4.7.2'
    FunctionsToExport      = @('Convert-HTMLToText', 'ConvertFrom-HTML', 'ConvertFrom-HTMLAttributes', 'ConvertFrom-HtmlTable', 'Format-CSS', 'Format-HTML', 'Format-JavaScript', 'Optimize-CSS', 'Optimize-HTML', 'Optimize-JavaScript')
    GUID                   = 'f0387960-7034-4918-a1e1-d5847cbf90df'
    ModuleVersion          = '1.0.2'
    PowerShellVersion      = '5.1'
    PrivateData            = @{
        PSData = @{
            ExternalModuleDependencies = @('Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility')
            IconUri                    = 'https://evotec.xyz/wp-content/uploads/2018/12/PSWriteHTML.png'
            ProjectUri                 = 'https://github.com/EvotecIT/PSParseHTML'
            Tags                       = @('HTML', 'WWW', 'JavaScript', 'CSS', 'Windows', 'MacOS', 'Linux')
        }
    }
    RequiredModules        = @('Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility')
    RootModule             = 'PSParseHTML.psm1'
}