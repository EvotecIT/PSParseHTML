Describe -Name 'ConvertFrom-HtmlTable' {
    It 'Given a HTML table online with polish chars - Should convert it to a PowerShell object' {
        $Url = 'https://ifj.edu.pl/private/krawczyk/kurshtml/tabele/tabele.htm'

        $AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AgilityPack
        $AllTables.Count | Should -Be 47
        $AllTables[12].'Komórka a1' = 'Komórka a3'
        $AllTables[12].'Komórka a2' = 'Komórka a4'

        $AllTables[0][0].a1 = 'b1'
        $AllTables[0][0].a2 = 'b2'
        $AllTables[0][0].a3 = 'b3'

        $AllTables[0][1].a1 = 'c1'
        $AllTables[0][1].a2 = 'c2'
        $AllTables[0][1].a3 = 'c3'
    }
}