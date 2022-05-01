## ChangeLog

#### - 0.0.21 - 2022.05.01
  - Fixes issue with ConvertFrom-HTMLTable when using AgilityPack. Using **AgilityPack** for HTML parsing would fail to detect encoding or convert special chars. This release fixes this.
  - Updates libraries:
    - AngleSharp to version 0.16.1.0
    - AngleSharp.Css to version 0.16.4.0
    - HtmlAgilityPack to version 1.11.42.0
    - NUglify to version 1.12.0.0

#### - 0.0.20 - 2022.01.16
  - Added ConvertTo-HTML function

#### - 0.0.19 - 2021.03.14
  - Update NUglify to 1.13.6
#### - 0.0.18 - 2021.02.02
  - Update NUglify to 1.13.2
  - Update HtmlAgilityPack to v1.11.30
  - Better formatting HTML (including JS/CSS)
  - Better minimizing HTML (including JS/CSS)
  - Fixes ConvertFrom-HtmlTable for some use cases
#### - 0.0.17 - 2020.10.21
  - Update NUglify to 1.9.9
#### - 0.0.16 - 2020.08.21
  - Improvements to ConvertFrom-HTMLAttributes
#### - 0.0.14 - 2020.02.12
  - Added ConvertFrom-HTMLAttributes. Can search for Tags/Classes
  - Removed ConvertFrom-HTMLTag and added it as an alias to ConvertFrom-HTMLAttributes
#### - 0.0.13 - 2020.01.04
  - Fix for Optimize-HTML - it wasn't working at all
#### - 0.0.9 - 10.10.2019
  - Updated ConvertFrom-HTMLTable fixing problem with the header being part of the table (fix by Anthony Howell!)
#### - 0.0.8 - 8.10.2019
  - Updated ConvertFrom-HTMLTable to support more tables
  - Added ConvertFrom-HTMLTag
#### - 0.0.6 - 6.10.2019
  - Added ConvertFrom-HTMLTable (Thank you - Anthony Howell!)
#### - 0.0.5 - 11.08.2019 - [Blog post for the release](https://evotec.xyz/formatting-and-minifying-resources-html-css-javascript-with-powershell/)
  - First public release