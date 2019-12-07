Function ConvertFrom-HtmlTable {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Content')][string]$Content,
        [Parameter(Mandatory = $true, ParameterSetName = 'Uri')][Uri] $Url,
        [Array] $ReplaceDictionary
    )
    Begin {
        # Initialize the parser
        $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
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

            # Get the headers / Where-Object is nessecary to get rid of empty values
            [Array] $headers = $table.Rows[0].Cells.TextContent.Trim() #| Where-Object { $_ }

            # if headers have value
            if ($Headers.Count -ge 1) {
                [Array] $output = foreach ($row in $table.Rows | Select-Object -Skip 1) {

                    # If there aren't as many cells as headers, skip this table
                    #if (@($row.Cells).count -ne $headers.count) {
                    #Write-Warning 'Unsupported table.'
                    #     Continue table
                    #}
                    $obj = [ordered]@{ }
                    # add all the properties, one per row
                    for ($x = 0; $x -lt $headers.count; $x++) {
                        if ($($headers[$x])) {
                            if ($row.Cells[$x].TextContent) {
                                $obj["$($headers[$x])"] = $row.Cells[$x].TextContent.Trim()
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
