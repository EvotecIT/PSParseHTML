﻿#Requires -Modules Pester
Import-Module $PSScriptRoot\..\PSParseHTML.psd1

Describe 'Format-CSS' {
    It 'Given minified CSS content - Should Format it' {
        $Content = '.tabsWrapper{text-align:center;margin:10px auto;font-family:"Roboto", sans-serif!important}.tabs{margin-top:10px;font-size:15px;padding:0;list-style:none;background:rgba(255, 255, 255, 1);box-shadow:0 5px 20px rgba(0, 0, 0, 0.1);border-radius:4px;position:relative}.tabs .round{border-radius:4px}.tabs a{text-decoration:none;color:rgba(119, 119, 119, 1);text-transform:uppercase;padding:10px 20px;display:inline-block;position:relative;z-index:1;transition-duration:0.6s}.tabs a.active{color:rgba(255, 255, 255, 1)}.tabs a i{margin-right:5px}.tabs .selector{display:none;height:100%;position:absolute;left:0;top:0;right:0;bottom:0;z-index:1;border-radius:4px}.tabs-content{display:none}.tabs-content.active{display:block}'
        $ExpectedOutput = @"
.tabsWrapper { text-align: center; margin: 10px auto; font-family: "Roboto", sans-serif !important }
.tabs { margin-top: 10px; font-size: 15px; padding: 0; list-style: none; background: rgba(255, 255, 255, 1); box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1); border-radius: 4px; position: relative }
.tabs .round { border-radius: 4px }
.tabs a { text-decoration: none; color: rgba(119, 119, 119, 1); text-transform: uppercase; padding: 10px 20px; display: inline-block; position: relative; z-index: 1; transition-duration: 0.6s }
.tabs a.active { color: rgba(255, 255, 255, 1) }
.tabs a i { margin-right: 5px }
.tabs .selector { display: none; height: 100%; position: absolute; left: 0; top: 0; right: 0; bottom: 0; z-index: 1; border-radius: 4px }
.tabs-content { display: none }
.tabs-content.active { display: block }
"@
        $Output = Format-CSS -Content $Content
        $Output | Should -Be $ExpectedOutput
    }
}