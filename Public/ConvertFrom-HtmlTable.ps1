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
        $tables = @()
        $ParsedDocument.GetElementsByTagName('table') | %{$tables+=$_}

        # For each table
        :table foreach ($table in $tables) {
            $output = @()
            # Get the headers
            $headers = $table.Rows[0].Cells.TextContent.Trim() | ?{$_}

            # if headers have value
            if ($null -ne $headers) {
                foreach ($row in $table.Rows | Select -SkipIndex 0) {
                    
                    # If there aren't as many cells as headers, skip this table
                    if (@($row.Cells).count -ne $headers.count) {
                        Write-Verbose 'Unsupported table.'
                        Continue table
                    }
                    $obj = [pscustomobject]@{}
                    
                    # add all the properties, one per row
                    for ($x=0;$x -lt $headers.count;$x++){
                        $obj | Add-Member -MemberType NoteProperty -Name $headers[$x] -Value $row.Cells[$x].TextContent.Trim()
                    }
                    $output += $obj
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