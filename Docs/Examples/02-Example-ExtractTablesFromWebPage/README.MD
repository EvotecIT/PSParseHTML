## Extracting tables from web page

Extracting tables from the web page is an easy task when using **PSParseHTML**.

```powershell
$Url = 'https://en.wikipedia.org/wiki/List_of_AMD_Ryzen_processors'

$AllTables = ConvertFrom-HtmlTable -Url $Url
$AllTables.Count
$AllTables[12] | Format-Table
```


```powershell
$Url = 'https://ifj.edu.pl/private/krawczyk/kurshtml/tabele/tabele.htm'

$AllTables = ConvertFrom-HtmlTable -Url $Url
$AllTables.Count
$AllTables[12] | Format-Table
```

PSParseHTML provides two engines to play with HTML. One is based on HTML Agility Pack, and the other is Angle Sharp.
This provides the unique ability to choose the one that works best for a given case, as HTML tends to be tricky.

```powershell
$Url = 'https://en.wikipedia.org/wiki/List_of_AMD_Ryzen_processors'

$AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AngleSharp
$AllTables.Count
$AllTables[12] | Format-Table
```

Output from the above example:

```PowerShell
Model                   Releasedate      Fab              CPU   GPU          Socket           PCIela
                                                                                              nes
-----                   -----------      ---              ---   ---          ------           ------
Cores(threads)          Core config[i]   Clock rate (GHz) Cache Architecture Config[ii]       Clock
Base                    Boost            L1               L2    L3
Ryzen 3 5300U[152]      January 12, 2021 TSMC7FF          4 (8) 1 × 4        2.6              3.8
Ryzen 5 5500U[153][154] 6 (12)           2 × 3            2.1   4.0          8 MB4 MB per CCX 448...
Ryzen 7 5700U[155]      8 (16)           2 × 4            1.8   4.3          512:32:88 CU     190...
```


```powershell
$Url = 'https://ifj.edu.pl/private/krawczyk/kurshtml/tabele/tabele.htm'

$AllTables = ConvertFrom-HtmlTable -Url $Url -Engine AngleSharp
$AllTables.Count
$AllTables[12] | Format-Table
```

Output from the above example:

```PowerShell
Komórka a1 Komórka a2
---------- ----------
Komórka a3 Komórka a4
```

As seen above module supports proper encoding, which it tries to autodetect during a scan of a webpage.