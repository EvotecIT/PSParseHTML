function ConvertFrom-HTMLAttributes {
    [alias('ConvertFrom-HTMLTag', 'ConvertFrom-HTMLClass')]
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)][Array] $Content,
        [string] $Tag,
        [string] $Class,
        [switch] $ReturnObject
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
            if ($ReturnObject) {
                $TagContent
            } else {
                $TagContent.TextContent
            }
        } elseif ($Class) {
            [Array] $ClassContent = $ParsedDocument.GetElementsByClassName($Class)
            if ($ReturnObject) {
                $ClassContent
            } else {
                $ClassContent.TextContent
            }
        }
    }
    End { }
}