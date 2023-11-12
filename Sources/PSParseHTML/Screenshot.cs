using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using PuppeteerSharp;

namespace PSParseHTML {
    //    public class ScreenShot {

    //        public static async void TakeScreenshot(string url, string outputFile) {

    //            //await new BrowserFetcher().DownloadAsync(BrowserTag.Canary);
    //            //await new BrowserFetcher(SupportedBrowser.Chromium).DownloadAsync();
    //            //using var browserFetcher = new BrowserFetcher();
    //            //browserFetcher.DownloadAsync();
    //            //   await browserFetcher.DownloadAsync();

    //            //url = "https://www.somepage.com";
    //            var file = outputFile;

    //            var launchOptions = new LaunchOptions() {
    //                Headless = false,
    //                SlowMo = 50,
    //                ExecutablePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe"
    //            };

    //            using (var browser = await Puppeteer.LaunchAsync(launchOptions))
    //            using (var page = await browser.NewPageAsync()) {
    //                await page.GoToAsync("http://www.google.com");
    //                var jsSelectAllAnchors = @"Array.from(document.querySelectorAll('a')).map(a => a.href);";
    //                var urls = await page.EvaluateExpressionAsync<string[]>(jsSelectAllAnchors);
    //                foreach (string u in urls) {
    //                    Console.WriteLine($"Url: {u}");
    //                }
    //                Console.WriteLine("Press any key to continue...");
    //                Console.ReadLine();
    //            }
    //        }

    //        public class Data {
    //            public string Title { get; set; }
    //            public string Url { get; set; }
    //        }

    //        public static async void Test() {
    //            var options = new LaunchOptions() {
    //                Headless = false,
    //                SlowMo = 50,
    //                ExecutablePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe",

    //            };

    //            using (var browser = await Puppeteer.LaunchAsync(options))
    //            using (var page = await browser.NewPageAsync()) {
    //                await page.GoToAsync("https://news.ycombinator.com/");
    //                Console.WriteLine("Get all urls from page");
    //                var jsCode = @"() => {
    //const selectors = Array.from(document.querySelectorAll('a[class=""storylink""]'));
    //return selectors.map( t=> {return { title: t.innerHTML, url: t.href}});
    //}";
    //                var results = await page.EvaluateFunctionAsync<Data[]>(jsCode);
    //                foreach (var result in results) {
    //                    Console.WriteLine(result.ToString());
    //                }
    //                Console.WriteLine("Press any key to continue...");
    //                Console.ReadLine();
    //            }
    //        }
    //    }
}
