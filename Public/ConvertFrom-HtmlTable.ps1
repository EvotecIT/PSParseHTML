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
        [array]$tables = $ParsedDocument.GetElementsByTagName('table')

        # For each table
        :table foreach ($table in $tables) {
            # Get the headers
            $headers = $table.Rows[0].Cells.TextContent.Trim() | Where-Object{$_}

            # if headers have value
            if ($null -ne $headers) {
                [pscustomobject]$output = foreach ($row in $table.Rows | Select-Object -SkipIndex 0) {
                    
                    # If there aren't as many cells as headers, skip this table
                    if (@($row.Cells).count -ne $headers.count) {
                        Write-Verbose 'Unsupported tab le.'
                        Continue table
                    }
                    $obj = @{}
                    
                    # add all the properties, one per row
                    for ($x=0;$x -lt $headers.count;$x++){
                        $obj["$($headers[$x])"] = $row.Cells[$x].TextContent.Trim()
                    }
                    [pscustomobject]$obj
                }
                # if there are any rows, output
                if($output.count -ge 1) {
                    @(,$output)
                    Remove-Variable output
                } else {
                    Write-Verbose 'Table has no rows'
                }
            }
        }
    }
    End {}
}