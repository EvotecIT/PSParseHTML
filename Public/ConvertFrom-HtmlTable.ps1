Function ConvertFrom-HtmlTable {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Content')][string]$Content,
        [Parameter(Mandatory = $true, ParameterSetName = 'Uri')][Uri] $Url,
        [System.Collections.IDictionary] $ReplaceContent,
        [System.Collections.IDictionary] $ReplaceHeaders
    )
    Begin {
        # This fixes an issue https://github.com/PowerShell/PowerShell/issues/11287 for ConvertTo-HTML
        $HeadersReplacement = [ordered] @{ '\*' = ''; }
        # Initialize the parser
        $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
        if (-not $ReplaceHeaders) {
            $ReplaceHeaders = [ordered] @{ }
        }
        foreach ($Key in $HeadersReplacement.Keys) {
            $ReplaceHeaders["$Key"] = $HeadersReplacement.$Key
        }
    }
    Process {
        if ($Url) {
            $Content = (Invoke-WebRequest -Uri $Url).Content
        }
        if (-not $Content) {
            return
        }
        # Load the html
        $ParsedDocument = $HTMLParser.ParseDocument($Content)

        # Get all the tables
        [Array] $Tables = $ParsedDocument.GetElementsByTagName('table')

        # For each table
        :table foreach ($table in $tables) {
            [Array] $headers = foreach ($_ in $Table.Rows[0].Cells) {
                $CellContent = $_.TextContent.Trim()
                if ($ReplaceHeaders) {
                    foreach ($Key in $ReplaceHeaders.Keys) {
                        $CellContent = $CellContent -replace $Key, $ReplaceHeaders.$Key
                    }
                }
                $CellContent
            }

            # if headers have value
            if ($Headers.Count -ge 1) {
                [Array] $output = foreach ($row in $table.Rows | Select-Object -Skip 1) {

                    $obj = [ordered]@{ }
                    # add all the properties, one per row
                    for ($x = 0; $x -lt $headers.count; $x++) {
                        if ($($headers[$x])) {
                            if ($row.Cells[$x].TextContent) {
                                $CellContent = $row.Cells[$x].TextContent.Trim()
                                if ($ReplaceContent) {
                                    foreach ($Key in $ReplaceContent.Keys) {
                                        $CellContent = $CellContent -replace $Key, $ReplaceContent.$Key
                                    }
                                }
                                $obj["$($headers[$x])"] = $CellContent
                            } else {
                                $obj["$($headers[$x])"] = $row.Cells[$x].TextContent
                            }
                        } else {
                            $obj["$x"] = $row.Cells[$x].TextContent #.Trim()
                        }
                    }
                    [PSCustomObject] $obj
                }
                # if there are any rows, output
                if ($output.count -ge 1) {
                    @(, $output)
                } else {
                    Write-Verbose 'ConvertFrom-HtmlTable - Table has no rows. Skipping'
                }
            }
        }
    }
    End { }
}