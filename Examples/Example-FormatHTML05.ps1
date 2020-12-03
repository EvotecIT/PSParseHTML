Import-Module .\PSParseHTML.psd1 -Force

Format-HTML -File $PSScriptRoot\Input\Test.html #-OutputFile $PSScriptRoot\Input\Test1.html
Optimize-HTML -File $PSScriptRoot\Input\Test.html