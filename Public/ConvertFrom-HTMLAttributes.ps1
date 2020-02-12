function ConvertFrom-HTMLAttributes {
    [alias('ConvertFrom-HTMLTag', 'ConvertFrom-HTMLClass')]
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)][string]$Content,
        [string]$Tag,
        [string]$Class
    )
    Begin {
        # Initialize the parser
        $HTMLParser = [AngleSharp.Html.Parser.HtmlParser]::new()
    }
    Process {
        # Load the html
        $ParsedDocument = $HTMLParser.ParseDocument($content)
        # Get all the tables
        if ($Tag) {
            [Array] $TagContent = $ParsedDocument.GetElementsByTagName($Tag)
            $TagContent.TextContent
        } elseif ($Class) {
            [Array] $ClassContent = $ParsedDocument.GetElementsByClassName($Class)
            $ClassContent.TextContent
        }
    }
    End { }
}