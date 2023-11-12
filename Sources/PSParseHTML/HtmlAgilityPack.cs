using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using static System.Net.Mime.MediaTypeNames;

namespace PSParseHTML {
    public class HtmlAgilityPack {

        //private void LoadHtmlWithBrowser(String url) {
        //    webBrowser1.ScriptErrorsSuppressed = true;
        //    webBrowser1.Navigate(url);

        //    waitTillLoad(this.webBrowser1);

        //    HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
        //    var documentAsIHtmlDocument3 = (mshtml.IHTMLDocument3)webBrowser1.Document.DomDocument;
        //    StringReader sr = new StringReader(documentAsIHtmlDocument3.documentElement.outerHTML);
        //    doc.Load(sr);
        //}

        //private void waitTillLoad(WebBrowser webBrControl) {
        //    WebBrowserReadyState loadStatus;
        //    int waittime = 100000;
        //    int counter = 0;
        //    while (true) {
        //        loadStatus = webBrControl.ReadyState;
        //        Application.DoEvents();
        //        if ((counter > waittime) || (loadStatus == WebBrowserReadyState.Uninitialized) || (loadStatus == WebBrowserReadyState.Loading) || (loadStatus == WebBrowserReadyState.Interactive)) {
        //            break;
        //        }
        //        counter++;
        //    }

        //    counter = 0;
        //    while (true) {
        //        loadStatus = webBrControl.ReadyState;
        //        Application.DoEvents();
        //        if (loadStatus == WebBrowserReadyState.Complete && webBrControl.IsBusy != true) {
        //            break;
        //        }
        //        counter++;
        //    }
        //}
    }
}
