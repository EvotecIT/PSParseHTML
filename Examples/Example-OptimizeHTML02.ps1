Import-Module .\PSParseHTML.psd1 -Force

Optimize-HTML -Content $HTML -File $PSScriptRoot\Output\Example.Wikipedia.html -OutputFile $PSScriptRoot\Output\Example.WikipediaMinimized.html