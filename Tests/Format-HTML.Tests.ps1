Describe 'Format-HTML' {
    It 'Given minified HTML content - Should Format it' {
        $ExpectedOutput = @"
<html>
    <!-- HEADER -->
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="author" />
        <meta content="2019-08-09 11:26:37" name="revised" />
        <title>My title</title>
        <!-- CSS Default fonts START -->
        <link href="https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald" type="text/css" rel="stylesheet" />
        <!-- CSS Default fonts END -->
        <!-- CSS Default fonts icons START -->
        <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" type="text/css" rel="stylesheet" />
        <!-- CSS Default fonts icons END -->
        <div class="flexElement overflowHidden">
            <table id="DT-hZRTQIVT" class="display compact">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th class="none">Id</th>
                        <th class="none">HandleCount</th>
                        <th>WorkingSet</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1Password</td>
                        <td>22268</td>
                        <td>1007</td>
                        <td>87146496</td>
                    </tr>
                    <tr>
                        <td>aesm_service</td>
                        <td>25340</td>
                        <td>189</td>
                        <td>3948544</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- END BODY -->
        <!-- FOOTER -->
        <footer></footer>
        <!-- END FOOTER -->
    </head>
</html>
"@.Replace("`r`n", "`n")
        $HTMLContent = '<html><!-- HEADER --><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1" name="viewport"/><meta name="author"/><meta content="2019-08-09 11:26:37" name="revised"/><title>My title</title><!-- CSS Default fonts START --><link href="https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald" type="text/css" rel="stylesheet"/><!-- CSS Default fonts END --><!-- CSS Default fonts icons START --><link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" type="text/css" rel="stylesheet"/><!-- CSS Default fonts icons END --><div class="flexElement overflowHidden"><table id="DT-hZRTQIVT" class="display compact"><thead><tr><th>Name</th><th class="none">Id</th><th class="none">HandleCount</th><th>WorkingSet</th></tr></thead><tbody><tr><td>1Password</td><td>22268</td><td>1007</td><td>87146496</td></tr><tr><td>aesm_service</td><td>25340</td><td>189</td><td>3948544</td></tr></tbody></table></div></div></div></div></body><!-- END BODY --><!-- FOOTER --><footer></footer><!-- END FOOTER --></html>'

        $Output = Format-HTML -Content $HTMLContent
        $Output | Should -Be $ExpectedOutput
    }

    It 'Given minified HTML content with CSS - Should Format it' {
        $HTMLContent = @'
<!DOCTYPE html><html><head><meta content="text/html; charset=utf-8" http-equiv=Content-Type /><meta content="width=device-width, initial-scale=1" name=viewport /><meta content="2020-11-15 15:47:42" name=revised /><title></title><style>body{font-family:Roboto Condensed,Helvetica Neue,sans-serif;font-size:8pt;margin:0}input{font-size:8pt}.defaultHeader{padding:5px;margin:0 0 0 0;font-weight:bold}.defaultFooter{padding-right:5em;text-align:right}.container{padding:2px 16px}.header{background-color:#616a6b;color:#f7f9f9}hr{height:4px;background-color:#6cf;border:0;width:100%}.card:hover{box-shadow:0 8px 16px 0 rgba(0,0,0,.2)}.col{padding:20px;margin:1%;flex:1}</style><style>.overflowHidden{overflow:hidden;overflow-x:hidden;overflow-y:hidden}.flexParent{display:flex;justify-content:space-between}.flexParentInvisible{display:flex;justify-content:space-between}.flexElement{flex-basis:100%}.flexPanel{flex-basis:100%}.flex-grid{display:flex}</style><style>.logos{display:flex}.leftLogo{flex-basis:100%;border:0;padding-left:0;vertical-align:middle}.rightLogo{flex-basis:100%;border:0;padding-right:5em;text-align:right;vertical-align:middle}img{border-radius:5px 5px 0 0}</style><style>a.alink:link{color:#007bff;text-decoration:none;font-size:120%}a.alink:visited{color:#ff8400;text-decoration:none;font-size:120%}a.alink:hover{text-decoration:underline;font-size:130%}a.paginate_button{color:#000 !important;font-size:10px}a.current{color:#000 !important}</style><link href="https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald" type=text/css rel=stylesheet /><link href=https://use.fontawesome.com/releases/v5.14.0/css/all.css type=text/css rel=stylesheet /><style>@media all and (-ms-high-contrast:active){.defaultSection{display:flex}}.defaultSection{flex-direction:column;border:1px solid #bbb;padding-bottom:0;margin:5px;width:calc(100% - 10px);box-shadow:0 4px 8px 0 rgba(0,0,0,.2);transition:.3s;border-radius:5px}.defaultSectionHead{display:flex;justify-content:center;padding:5px;margin:0 0 0 0;font-weight:bold;background-color:#00bfff;color:#fff}.defaultSectionText{text-align:center}.defaultPanel{box-shadow:0 4px 8px 0 rgba(0,0,0,.2);transition:.3s;border-radius:5px;margin:5px}</style><style>h1,h2,h3,h4,h5,h6{font-family:'Hammersmith One',sans-serif}h1{font-size:30px;line-height:20px;margin:1em 0 .6em 0;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;color:#6cf;margin:10px 10px 10px 10px}h2{margin:1em 0 .6em 0;padding:0 0 0 20px;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;font-size:25px;line-height:20px;margin:10px 10px 10px 10px}h3{margin:1em 0 .6em 0;padding:0 0 0 20px;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;font-size:24px;line-height:20px;margin:10px 10px 10px 10px}h4{margin:1em 0 .6em 0;padding:0 0 0 20px;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;font-size:18px;line-height:16px;margin:10px 10px 10px 10px}h5{margin:1em 0 .6em 0;padding:0 0 0 20px;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;font-size:14px;line-height:16px;margin:10px 10px 10px 10px}h6{margin:1em 0 .6em 0;padding:0 0 0 20px;font-weight:normal;text-shadow:0 -1px 0 rgba(0,0,0,.4);position:relative;font-size:10px;line-height:12px;margin:10px 10px 10px 10px}</style></head><body><div class=main-section></div><footer></footer></body></html>
'@
        $ExpectedOutput = @"
<!DOCTYPE html>
<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="2020-11-15 15:47:42" name="revised" />
        <title></title>
        <style>
            body {
                font-family: Roboto Condensed,Helvetica Neue,sans-serif;
                font-size: 8pt;
                margin: 0
            }
            input {
                font-size: 8pt
            }
            .defaultHeader {
                padding: 5px;
                margin: 0 0 0 0;
                font-weight: bold
            }
            .defaultFooter {
                padding-right: 5em;
                text-align: right
            }
            .container {
                padding: 2px 16px
            }
            .header {
                background-color: #616a6b;
                color: #f7f9f9
            }
            hr {
                height: 4px;
                background-color: #6cf;
                border: 0;
                width: 100%
            }
            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,.2)
            }
            .col {
                padding: 20px;
                margin: 1%;
                flex: 1
            }
        </style>
        <style>
            .overflowHidden {
                overflow: hidden;
                overflow-x: hidden;
                overflow-y: hidden
            }
            .flexParent {
                display: flex;
                justify-content: space-between
            }
            .flexParentInvisible {
                display: flex;
                justify-content: space-between
            }
            .flexElement {
                flex-basis: 100%
            }
            .flexPanel {
                flex-basis: 100%
            }
            .flex-grid {
                display: flex
            }
        </style>
        <style>
            .logos {
                display: flex
            }
            .leftLogo {
                flex-basis: 100%;
                border: 0;
                padding-left: 0;
                vertical-align: middle
            }
            .rightLogo {
                flex-basis: 100%;
                border: 0;
                padding-right: 5em;
                text-align: right;
                vertical-align: middle
            }
            img {
                border-radius: 5px 5px 0 0
            }
        </style>
        <style>
            a.alink:link {
                color: #007bff;
                text-decoration: none;
                font-size: 120%
            }
            a.alink:visited {
                color: #ff8400;
                text-decoration: none;
                font-size: 120%
            }
            a.alink:hover {
                text-decoration: underline;
                font-size: 130%
            }
            a.paginate_button {
                color: #000!important;
                font-size: 10px
            }
            a.current {
                color: #000!important
            }
        </style>
        <link href="https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald" type="text/css" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" type="text/css" rel="stylesheet" />
        <style>
            @media all and (-ms-high-contrast: active) {
                .defaultSection {
                    display: flex
                }
            }
            .defaultSection {
                flex-direction: column;
                border: 1px solid #bbb;
                padding-bottom: 0;
                margin: 5px;
                width: calc(100% - 10px);
                box-shadow: 0 4px 8px 0 rgba(0,0,0,.2);
                transition: .3s;
                border-radius: 5px
            }
            .defaultSectionHead {
                display: flex;
                justify-content: center;
                padding: 5px;
                margin: 0 0 0 0;
                font-weight: bold;
                background-color: #00bfff;
                color: #fff
            }
            .defaultSectionText {
                text-align: center
            }
            .defaultPanel {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,.2);
                transition: .3s;
                border-radius: 5px;
                margin: 5px
            }
        </style>
        <style>
            h1, h2, h3, h4, h5, h6 {
                font-family: 'Hammersmith One',sans-serif
            }
            h1 {
                font-size: 30px;
                line-height: 20px;
                margin: 1em 0 .6em 0;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                color: #6cf;
                margin: 10px 10px 10px 10px
            }
            h2 {
                margin: 1em 0 .6em 0;
                padding: 0 0 0 20px;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                font-size: 25px;
                line-height: 20px;
                margin: 10px 10px 10px 10px
            }
            h3 {
                margin: 1em 0 .6em 0;
                padding: 0 0 0 20px;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                font-size: 24px;
                line-height: 20px;
                margin: 10px 10px 10px 10px
            }
            h4 {
                margin: 1em 0 .6em 0;
                padding: 0 0 0 20px;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                font-size: 18px;
                line-height: 16px;
                margin: 10px 10px 10px 10px
            }
            h5 {
                margin: 1em 0 .6em 0;
                padding: 0 0 0 20px;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                font-size: 14px;
                line-height: 16px;
                margin: 10px 10px 10px 10px
            }
            h6 {
                margin: 1em 0 .6em 0;
                padding: 0 0 0 20px;
                font-weight: normal;
                text-shadow: 0 -1px 0 rgba(0,0,0,.4);
                position: relative;
                font-size: 10px;
                line-height: 12px;
                margin: 10px 10px 10px 10px
            }
        </style>
    </head>
    <body>
        <div class="main-section"></div>
        <footer></footer>
    </body>
</html>
"@.Replace("`r`n", "`n")
        $Output = Format-HTML -Content $HTMLContent
        $Output | Should -Be $ExpectedOutput
    }

}