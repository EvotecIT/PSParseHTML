Import-Module .\PSParseHTML.psd1 -Force

Format-HTML -File $PSScriptRoot\Output\Example.Toasts.html -OutputFile $PSScriptRoot\Output\Example.Toasts1.html
Format-HTML -File $PSScriptRoot\Output\Example.Wikipedia.html -OutputFile $PSScriptRoot\Output\Example.Wikipedia.Formatted.html