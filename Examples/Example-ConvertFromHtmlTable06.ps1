Import-Module .\PSParseHTML.psd1 -Force

$Url = 'https://en.wikipedia.org/wiki/List_of_AMD_Ryzen_processors'

$AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AngleSharp
$AllTables.Count
$AllTables[12] | Format-Table

$Url = 'https://ifj.edu.pl/private/krawczyk/kurshtml/tabele/tabele.htm'

$AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AgilityPack
$AllTables.Count
$AllTables[12] | Format-Table
