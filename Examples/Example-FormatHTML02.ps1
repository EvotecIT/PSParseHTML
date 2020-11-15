Import-Module .\PSParseHTML.psd1 -Force

Optimize-HTML -File $PSScriptRoot\Output\Example.Formatted.html -OutputFile $PSScriptRoot\Output\Example.Minified.html
Format-HTML -File $PSScriptRoot\Output\Example.Formatted.html -OutputFile $PSScriptRoot\Output\Example.Formatted1.html #-RemoveHTMLComments

#Format-HTML -File $PSScriptRoot\Output\Example.Formatted2.html -OutputFile $PSScriptRoot\Output\Example.Formatted3.html