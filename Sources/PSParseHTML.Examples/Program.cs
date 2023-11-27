using AngleSharp;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using PSParseHTML;
using SeleniumExtras.WaitHelpers;
using WebDriverManager;
using WebDriverManager.DriverConfigs.Impl;
using WebDriverManager.Helpers;

// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");

//PSParseHTML.ScreenShot.TakeScreenshot("https://www.google.com", "C:\\Temp\\google.png");
//PSParseHTML.ScreenShot.Test();
//PSParseHTML.AngleSharp.Test();

//var config = Configuration.Default.WithDefaultLoader();
//var address = "https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw";
//var context = BrowsingContext.New(config);
//var document = await context.OpenAsync(address);
//var cellSelector = "tr";

//var test = document.GetElementsByTagName("table");

//var cells = document.QuerySelectorAll(cellSelector);
//var titles = cells.Select(m => m.TextContent);

//Console.WriteLine(titles);


//new DriverManager().SetUpDriver(new zConfig());

//new DriverManager().SetUpDriver(
//    "https://chromedriver.storage.googleapis.com/2.25/chromedriver_win32.zip",
//    Path.Combine(Directory.GetCurrentDirectory(), "chromedriver.exe"),
//    "chromedriver.exe"
//);

new DriverManager().SetUpDriver(new ChromeConfig(), "2.25", Architecture.X64);

var options = new ChromeOptions();
options.AddArgument("--headless=new");
//var driver = new ChromeDriver(options);

IWebDriver driver = new ChromeDriver(options);
//driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(20);
driver.Url = "https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw";
//driver.Manage().Window.Minimize();
//driver.

//WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(40));
//wait.Until(ExpectedConditions.ElementExists(By.TagName("table")));

//driver.Navigate().GoToUrl("https://infogram.com/daily-summary-of-covid-19-in-australia-1hzj4on55vpp2pw");
var source = driver.PageSource.ToString();
var varlue = driver.FindElements(By.TagName("table"));

foreach (var item in varlue) {
    Console.WriteLine(item.Text);
    var test1 = item.GetDomAttribute("innerHTML");
    var test2 = item.GetAttribute("innerHTML");
    var test3 = item.Text;
    var test4 = item.Text;
}

//Console.WriteLine((varlue).Text);
//var source1 = driver.PageSource.ToString();
//var test12 = varlue.GetDomAttribute("table");
//var test13 = varlue.GetAttribute("innerHTML");
//var test132 = varlue.Text;
driver.Close();
driver.Quit();