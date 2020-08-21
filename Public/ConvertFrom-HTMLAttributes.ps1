function ConvertFrom-HTMLAttributes {
    [alias('ConvertFrom-HTMLTag', 'ConvertFrom-HTMLClass')]
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)][Array] $Content,
        [string] $Tag,
        [string] $Class,
        [string] $Id,
        [string] $Name,
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
            [Array] $OutputContent = $ParsedDocument.GetElementsByTagName($Tag)
        } elseif ($Class) {
            [Array] $OutputContent = $ParsedDocument.GetElementsByClassName($Class)
        } elseif ($Id) {
            [Array] $OutputContent = $ParsedDocument.GetElementById($Id)
        } elseif ($Name) {
            [Array] $OutputContent = $ParsedDocument.GetElementsByName($Name)
        }
        if ($OutputContent) {
            if ($ReturnObject) {
                $OutputContent
            } else {
                $OutputContent.TextContent
            }
        }
    }
    End { }
}