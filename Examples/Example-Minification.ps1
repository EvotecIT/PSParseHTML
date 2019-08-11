Import-Module .\PSParseHTML.psd1 -Force

Format-HTML -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Examples\Example25-Toasts\Example25.html' -OutputFile $PSScriptRoot\Output\Example.Toasts.html
Format-JavaScript -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\JS\moment.min.js' -OutputFile $PSScriptRoot\Output\Example.Moment.js
Optimize-CSS -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\CSS\datatables.min.css' -OutputFile $PSScriptRoot\Output\Example.DataTables.css
Optimize-JavaScript -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\JS\HideSection.js' -OutputFile $PSScriptRoot\Output\Example.HideSection.js
Optimize-JavaScript -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\JS\SkeletonTabs.js' -OutputFile $PSScriptRoot\Output\Example.SkeletonTabs.js
Optimize-HTML -File 'C:\Support\GitHub\PSParseHTML\Examples\Output\Example.Toasts.html' -OutputFile $PSScriptRoot\Output\Example.ToastsOptimized.html