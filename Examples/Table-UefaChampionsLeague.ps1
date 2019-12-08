Import-Module .\PSParseHTML.psd1 -Force

$Test = ConvertFrom-HtmlTable -Url 'https://www.goal.com/en-us/uefa-champions-league/table/4oogyu6o156iphvdvphwpck10'
for ($Count = 0; $Count -lt $Test.Count; $Count++) {
    $Test[$Count] | Format-Table -AutoSize *
}