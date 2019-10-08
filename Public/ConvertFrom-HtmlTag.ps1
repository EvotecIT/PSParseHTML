function ConvertFrom-HTMLTag {
    [cmdletbinding()]
    param (
        [Parameter(
            Mandatory = $true
        )]
        [string]$Content,
        [string]$Tag
    )
    Begin {
        # Initialize the parser
        $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    }
    Process {
        # Load the html
        $ParsedDocument = $HTMLParser.ParseDocument($content)
        # Get all the tables
        [Array] $TagContent = $ParsedDocument.GetElementsByTagName($Tag)
        $TagContent.TextContent
    }
    End { }
}