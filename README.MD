<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSParseHTML"><img src="https://img.shields.io/powershellgallery/v/PSParseHTML.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSParseHTML"><img src="https://img.shields.io/powershellgallery/vpre/PSParseHTML.svg?label=powershell%20gallery%20preview&colorB=yellow"></a>
  <a href="https://github.com/EvotecIT/PSParseHTML"><img src="https://img.shields.io/github/license/EvotecIT/PSParseHTML.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSParseHTML"><img src="https://img.shields.io/powershellgallery/p/PSParseHTML.svg"></a>
  <a href="https://github.com/EvotecIT/PSParseHTML"><img src="https://img.shields.io/github/languages/top/evotecit/PSParseHTML.svg"></a>
  <a href="https://github.com/EvotecIT/PSParseHTML"><img src="https://img.shields.io/github/languages/code-size/evotecit/PSParseHTML.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSParseHTML"><img src="https://img.shields.io/powershellgallery/dt/PSParseHTML.svg"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=social"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn"></a>
</p>

# PSParseHTML

**PSParseHTML** is PowerShell module that's main purpose is to be a helper module for [PSWriteHTML](https://github.com/EvotecIT/PSWriteHTML). However it's functionality can be utilized in other projects, not related to **PSWriteHTML**, therefore it's available as a separate module. Basic how-to usage is described [on this blog post](https://evotec.xyz/formatting-and-minifying-resources-html-css-javascript-with-powershell/).

**PSParseHTML** has 9 functions:

- Convert-HTMLToText
- ConvertFrom-HtmlTable
- ConvertFrom-HTMLTag
- Format-CSS
- Format-HTML
- Format-JavaScript
- Optimize-CSS
- Optimize-HTML
- Optimize-JavaScript

The expected input is a string or from a file. The expected output to string or to file.

## ChangeLog

- 0.0.14 - 2020.02.12
  - Added ConvertFrom-HTMLAttributes. Can search for Tags/Classes
  - Removed ConvertFrom-HTMLTag and added it as an alias to ConvertFromHTMLAttributes
- 0.0.13 - 2020.01.04
  - Fix for Optimize-HTML - it wasn't working at all
- 0.0.9 - 10.10.2019
  - Updated ConvertFrom-HTMLTable fixing problem with the header being part of the table (fix by Anthony Howell!)
- 0.0.8 - 8.10.2019
  - Updated ConvertFrom-HTMLTable to support more tables
  - Added ConvertFrom-HTMLTag
- 0.0.6 - 6.10.2019
  - Added ConvertFrom-HTMLTable (Thank you - Anthony Howell!)
- 0.0.5 - 11.08.2019 - [Blog post for the release](https://evotec.xyz/formatting-and-minifying-resources-html-css-javascript-with-powershell/)
  - First public release

## To install

```powershell
Install-Module -Name PSParseHTML -AllowClobber -Force
```

Force and AllowClobber aren't necessary but they do skip errors in case some appear.

## And to update

```powershell
Update-Module -Name PSParseHTML
```

That's it. Whenever there's a new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen **PowerShell** session if you have already used module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!

## 3rd party references

This module uses several external libraries to do its work. The authors of those libraries made a fantastic job. I've just added some PowerShell to the mix.

- [YUICompressor.NET](https://github.com/YUICompressor-NET/YUICompressor.NET)
- [AngleSharp](https://github.com/AngleSharp/AngleSharp)
- [Jsbeautifier](https://github.com/denis-ivanov/Jsbeautifier)
- [NUglify](https://github.com/xoofx/NUglify)
