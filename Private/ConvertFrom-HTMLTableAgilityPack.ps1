function ConvertFrom-HTMLTableAgilityPack {
    [cmdletbinding()]
    param(
        [Uri] $Url,
        [string] $Content,
        [System.Collections.IDictionary] $ReplaceContent,
        [System.Collections.IDictionary] $ReplaceHeaders
    )
    Begin { }
    Process {
        if ($Content) {
            [HtmlAgilityPack.HtmlDocument] $HtmlDocument = [HtmlAgilityPack.HtmlDocument]::new()
            $HtmlDocument.LoadHtml($Content)
        } else {
            [HtmlAgilityPack.HtmlWeb] $HtmlWeb = [HtmlAgilityPack.HtmlWeb]::new()
            [HtmlAgilityPack.HtmlDocument] $HtmlDocument = $HtmlWeb.Load($url)
        }
        [Array] $Tables = $HtmlDocument.DocumentNode.SelectNodes("//table")


        [Array] $OutputTables = :table foreach ($table in $Tables) {
            $Rows = $table.SelectNodes('.//tr')
            $Headers = foreach ($Row in $Rows[0]) {
                foreach ($Cell in $row.SelectNodes("th|td")) {
                    $CellContent = $Cell.InnerText.Trim()
                    if ($ReplaceHeaders) {
                        foreach ($Key in $ReplaceHeaders.Keys) {
                            $CellContent = $CellContent -replace $Key, $ReplaceHeaders.$Key
                        }
                    }
                    $CellContent
                }
            }
            $TableContent = foreach ($Row in $Rows | Select-Object -Skip 1) {
                $obj = [ordered] @{ }
                for ($x = 0; $x -lt $headers.count; $x++) {
                    if ($($headers[$x])) {
                        # $obj["$($headers[$x])"] = $row.SelectNodes("th|td")[$x].InnerText.Trim()
                        [string] $CellContent = $row.SelectNodes("th|td")[$x].InnerText
                        $CellContent = $CellContent.Trim()
                        if ($ReplaceContent) {
                            foreach ($Key in $ReplaceContent.Keys) {
                                $CellContent = $CellContent -replace $Key, $ReplaceContent.$Key
                            }
                        }
                        $obj["$($headers[$x])"] = $CellContent
                    } else {
                        $obj["$x"] = $row.SelectNodes("th|td")[$x].InnerText.Trim()
                    }
                }
                [PSCustomObject] $obj
            }
            @(, $TableContent)
        }
        $OutputTables
    }
    End { }
}