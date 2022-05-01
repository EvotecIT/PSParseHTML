<p align="center">
  <a href="https://dev.azure.com/evotecpl/PSParseHTML/_build/latest?definitionId=3"><img src="https://dev.azure.com/evotecpl/PSParseHTML/_apis/build/status/EvotecIT.PSParseHTML"></a>
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

**PSParseHTML** has 10 functions:

- Convert-HTMLToText
- ConvertFrom-HtmlTable
- ConvertFrom-HTMLAttributes
- ConvertFrom-HTML (aliases: `ConvertFrom-HTMLTag`, `ConvertFrom-HTMLClass`)
- Format-CSS
- Format-HTML
- Format-JavaScript
- Optimize-CSS
- Optimize-HTML
- Optimize-JavaScript

The expected input is a string or from a file. The expected output to string or to file.
While it doesn't seem much those 10 functions are very powerful and can achieve a lot when it comes to parsing HTML.

## Installation

### Install from PSGallery

```powershell
Install-Module -Name PSParseHTML -AllowClobber -Force
```

Force and AllowClobber aren't necessary but they do skip errors in case some appear.

### Update from PSGallery

```powershell
Update-Module -Name PSParseHTML
```

That's it. Whenever there's a new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen **PowerShell** session if you have already used module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!

## 3rd party references

This module uses several external libraries to do its work. The authors of those libraries made a fantastic job.
I've just added some PowerShell to the mix.

- [AngleSharp](https://github.com/AngleSharp/AngleSharp) - MIT License
- [AngleSharp CSS](https://github.com/AngleSharp/AngleSharp.Css) - MIT License
- [Jsbeautifier](https://github.com/denis-ivanov/Jsbeautifier) - MIT License
- [NUglify](https://github.com/trullock/NUglify) - BSD-Clause 2 license
- [Html Agility Pack](https://github.com/zzzprojects/html-agility-pack) - MIT License
