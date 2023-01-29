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

**PSParseHTML** started as a suite of data processing Cmdlets to help [PSWriteHTML](https://github.com/EvotecIT/PSWriteHTML), but it has gained functionality enough to be its own module. Basic usage instructions are described [on this blog post](https://evotec.xyz/formatting-and-minifying-resources-html-css-javascript-with-powershell/).

**PSParseHTML** provides the following ten (10) functions:

- Convert-HTMLToText
- ConvertFrom-HtmlTable
- ConvertFrom-HTMLAttributes (aliases: `ConvertFrom-HTMLTag`, `ConvertFrom-HTMLClass`)
- ConvertFrom-HTML
- Format-CSS
- Format-HTML
- Format-JavaScript
- Optimize-CSS
- Optimize-HTML
- Optimize-JavaScript

The expected input is a string literal or string data read from a file. The output can be PowerShell objects (classes are `HtmlNode` or `AngleSharp.Html.Dom.HtmlElement` depending on the chosen processing engine) or string literals written to `stdout`.

It may not seem like much, but those ten functions are powerful enough to realize robust HTML processing in shell.

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

That's it. Whenever there's a new version you simply run the `Update-Module` command and enjoy. Remember that you may need to close, re-open your **PowerShell** session if you had used the module prior to updating it.

As usual, **remember module updates may break your scripts**: if your scripts work for you in production, retain those versions until you test new versions in a dev environment. I may make small changes which are big enough so that your automated updates will break your scripts. For example, I might make a small rename to a parameter &mdash; boom, your code stops working! Be responsible!

## 3rd party references

This module utilizes several external dependencies to do its work. The authors of those libraries have done fantastic work &mdash; I've just added some PowerShell to the mix.

- [AngleSharp](https://github.com/AngleSharp/AngleSharp) - MIT License
- [AngleSharp CSS](https://github.com/AngleSharp/AngleSharp.Css) - MIT License
- [Jsbeautifier](https://github.com/denis-ivanov/Jsbeautifier) - MIT License
- [NUglify](https://github.com/trullock/NUglify) - BSD-Clause 2 license
- [Html Agility Pack](https://github.com/zzzprojects/html-agility-pack) - MIT License
