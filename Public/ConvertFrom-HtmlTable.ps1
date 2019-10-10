Function ConvertFrom-HtmlTable {
    [cmdletbinding()]
    param (
        [Parameter(
            Mandatory = $true
        )]
        [string]$Content
    )
    Begin {
        # Initialize the parser
        $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    }
    Process {
        # Load the html
        $ParsedDocument = $HTMLParser.ParseDocument($content)

        # Get all the tables
        [Array] $Tables = $ParsedDocument.GetElementsByTagName('table')

        # For each table
        :table foreach ($table in $tables) {

            # Get the headers / Where-Object is nessecary to get rid of empty values
            [Array] $headers = $table.Rows[0].Cells.TextContent.Trim() #| Where-Object { $_ }

            # if headers have value
            if ($Headers.Count -gt 1) {
                [Array] $output = foreach ($row in $table.Rows | Select-Object -Skip 1) {

                    # If there aren't as many cells as headers, skip this table
                    if (@($row.Cells).count -ne $headers.count) {
                        Write-Warning 'Unsupported table.'
                        Continue table
                    }
                    $obj = [ordered]@{ }
                    # add all the properties, one per row
                    for ($x = 0; $x -lt $headers.count; $x++) {
                        #$obj | Add-Member -MemberType NoteProperty -Name $headers[$x] -Value $row.Cells[$x].TextContent.Trim()
                        if ($($headers[$x]) -ne '') {
                            $obj["$($headers[$x])"] = $row.Cells[$x].TextContent.Trim()
                        } else {
                            $obj["$x"] = $row.Cells[$x].TextContent.Trim()
                        }
                    }
                    [PSCustomObject] $obj
                }
                # if there are any rows, output
                if ($output.count -ge 1) {
                    @(, $output)
                } else {
                    Write-Verbose 'Table has no rows'
                }
            }
        }
    }
    End { }
}
