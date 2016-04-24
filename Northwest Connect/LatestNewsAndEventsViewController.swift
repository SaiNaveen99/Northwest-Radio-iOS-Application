//
//  LatestNewsAndEventsViewController.swift
//  Northwest Connect
//
//  Created by Kola,Harish on 4/1/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit
import WebKit
class LatestNewsAndEventsViewController: UIViewController,NSXMLParserDelegate,WKNavigationDelegate {
    
    var pageIndex:Int!
    var linkName:String!
    var webview:WKWebView!
    var xmlParser: NSXMLParser!
    var entryTitle: String!
    var entryDescription: String!
    var entryLink: String!
    var currentParsedElement:String! = String()
    var entryDictionary: [String:String]! = Dictionary()
    var entriesArray:[Dictionary<String, String>]! = Array()
    var linksArray:[String] = []
    var date:[String] = []
    var titleAndLink:[String] = []
    var tagsArray:[String] = []
    var appDelegate:AppDelegate!
    
    //loading a view
    override func loadView() {
        super.loadView()
    }
    
    // view did load method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if linkName == "http://www.nwmissouri.edu/alumni/magazine/index.htm"
        {
            loadingWebView()
            parsingMagazineForNews(linkName)
        }
        else if linkName == "http://calendar.nwmissouri.edu/feed.xml?c=52&days=30"
        {
            loadingWebView()
            parsingRssFeedForEvents(linkName)
        }
    }
    
    //Loading webview
    func loadingWebView()
    {
        let height = self.view.frame.height
        let width = self.view.frame.width
        let xCoordinate = self.view.frame.origin.x
        let yCoordinate = self.view.frame.origin.y
        webview = WKWebView(frame: CGRectMake(xCoordinate+2, yCoordinate+2,width,height))
        self.view.addSubview(webview!)
        self.webview.navigationDelegate = self
    }
    // parsing the magazine page and loading the parsed contents in the webview
    func parsingMagazineForNews(urlForParsing:String)
    {
        let url1 = NSURL(string: "http://www.nwmissouri.edu/alumni/magazine/index.htm")
        let htmlHead = "<html><head></head><body><style type=\"text/css\"> body{ background-color:#f0f0f0;color:green;padding-top:100px;}div.newsSection{border-style:solid;border-color:#002266;width:800px;height:140px;margin-left:70px; margin-right:50px; margin-top:20px; }div.item-img{float:left;width:180px;height:120px;margin:10px; border-style:solid;border-color:#787878; margin:5px;}img{width:180px;height:120px;}div.item-body{margin-left:10px;font-size:22;color:#b32d00;}p.heading{font-size:30px;text-align:center;}a{text-decoration:none;color:#0033FF;}a:visited{color:crimson;}a:hover{color:blue;}</style><p class=\"heading\">Northwest Alumni News</p>"
        let htmlTail = "</body></html>"
        if let doc = HTML(url: url1!, encoding: NSUTF8StringEncoding)
        {
            let nodes = doc.css("#featuresNews")
            var htmlDataToDisplay:[String] = []
            var x = ""
            for ele in nodes
            {
                x = ele.innerHTML!
                let replacedString = x.stringByReplacingOccurrencesOfString("href=\"//www", withString: "href=\"https://www")
                let replacedString2 = replacedString.stringByReplacingOccurrencesOfString("src=\"//www", withString: "src=\"http://www")
                let deleteCurrentNewsHeader = replacedString2.stringByReplacingOccurrencesOfString("<h2><a href=\"https://www.nwmissouri.edu/media/index.htm\">Current News</a></h2>", withString: " ")
                let addingMainStartDivTag = deleteCurrentNewsHeader.stringByReplacingOccurrencesOfString("<li>", withString: "<div class = \"newsSection\">")
                let addingMainEndDivTag = addingMainStartDivTag.stringByReplacingOccurrencesOfString("</li>", withString: "</div>")
                let deletingUlTag = addingMainEndDivTag.stringByReplacingOccurrencesOfString("<ul>", withString: "")
                htmlDataToDisplay.append(deletingUlTag)
            }
            htmlDataToDisplay.insert(htmlHead, atIndex: 0)
            htmlDataToDisplay.insert(htmlTail, atIndex: htmlDataToDisplay.count-1)
            var sourceString = ""
            for x:String in htmlDataToDisplay
            {
                sourceString = sourceString+x
            }
            webview.loadHTMLString(sourceString, baseURL: nil)
        }
        
    }
    
    // parsing the rssfeed contents modifying them and loading in webview
   
    func parsingRssFeedForEvents(urlForParsing:String)
    {
        let urlForParsing = NSURL(string: "http://www.nwmissouri.edu/alumni/magazine/index.htm")
        if let doc = HTML(url: urlForParsing!, encoding: NSUTF8StringEncoding)
        {
            let rssContents = doc.css("#featuresEvents")
            for link in rssContents
            {
                let links = link.css("a,href")
                for x in links
                {
                    linksArray.append(x["href"]!)
                }
            }
            let rsslink = linksArray[1]
            let rssUrlRequest:NSURLRequest = NSURLRequest(URL:NSURL(string: rsslink)!)
            let queue:NSOperationQueue = NSOperationQueue()
            NSURLConnection.sendAsynchronousRequest(rssUrlRequest, queue: queue) {
                (response, data, error) -> Void in
                self.xmlParser = NSXMLParser(data: data!)
                self.xmlParser.delegate = self
                self.xmlParser.parse()
            }
        }
    }
    
    
    //parsing for start elements in rss feed
    func parser(parser: NSXMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName: String?,
        attributes attributeDict: [String : String]){
            if elementName == "title"{
                entryTitle = String()
                currentParsedElement = "title"
            }
            if elementName == "description"{
                entryDescription = String()
                currentParsedElement = "description"
            }
            if elementName == "link"{
                entryLink = String()
                currentParsedElement = "link"
            }
    }
    
    //parsing current parsed elements
    func parser(parser: NSXMLParser,
        
        foundCharacters string: String){
            if currentParsedElement == "title"{
                entryTitle = entryTitle + string
            }
            if currentParsedElement == "description"{
                entryDescription = entryDescription + string
            }
            if currentParsedElement == "link"{
                entryLink = entryLink + string
            }
    }
    
    // parsing for end elements in rss feed
    func parser(parser: NSXMLParser,
        
        didEndElement elementName: String,
        
        namespaceURI: String?,
        
        qualifiedName qName: String?){
            
            if elementName == "title"{
                entryDictionary["title"] = entryTitle
            }
            if elementName == "link"{
                entryDictionary["link"] = entryLink
            }
            if elementName == "description"{
                entryDictionary["description"] = entryDescription
                entriesArray.append(entryDictionary)
            }
    }
    
    //parse ending function and loading the parsed string in webview
    func parserDidEndDocument(parser: NSXMLParser){
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
        })
        let htmlHead = "<html><head></head><body><style type=\"text/css\">body{ background-color:#f0f0f0; padding-top:100px; margin-left:50px; color:green;}h3{color:black; font-size:0px;}a{text-decoration:none;color:#0033FF;}a:visited{color:crimson;}a:hover{color:blue;}div.eventsSection{ width: 800px;height:120px;border-style: solid;border-color: #002266; margin-left:50px;margin-right:40px;} div.dateSection{ float: left;width: 100px;height:100px;border-style: solid;border-color:#787878 ;font-size: 28px;text-align:center;margin:5px;} div.eventNameSection{margin-left: 50px;padding-top: 10px;font-size:22;color:#b32d00;}p.heading{font-size:30px;text-align:center;}</style><p class=\"heading\">Northwest Alumni Events</p>"
        let htmlTail = "</body></html>"
        var rssFeedArrayForDescription:[String:String] = [:]
        var rssFeedArray:[String:Dictionary<String,String>] = [:]
        var iteratingCount = 0
        var first = 1
        for x in self.entriesArray
        {
            if iteratingCount == 10
            {
                break;
            }
            if first <= 2
            {
                first++
            }
            else
            {
                rssFeedArrayForDescription[x["link"]!] = x["description"]
                rssFeedArray[x["title"]!] = rssFeedArrayForDescription
                self.convertingTitlesAndLinks(x["title"]!, link: x["link"]!)
                iteratingCount++
            }
        }
        for var i:Int = 0; i<self.date.count;i++
        {
            self.tagsArray.append(self.date[i])
            self.tagsArray.append(self.titleAndLink[i])
        }
        self.tagsArray.insert(htmlHead, atIndex: 0)
        self.tagsArray.insert(htmlTail, atIndex: self.tagsArray.count)
        var source = ""
        for x:String in self.tagsArray
        {
            source = source + x
        }
        self.webview.loadHTMLString(source, baseURL: nil)
    }
    
    //modifying the string with the table and heading tags
    func convertingTitlesAndLinks(title:String,link:String)
    {
        var modifiedTitleString:String = ""
        var modifiedAnchorString:String = ""
        var modifiedLink = ""
        let CombinedString:String = title
        let FilteredString:[String] = CombinedString.componentsSeparatedByString("-")
        modifiedTitleString = "<div class=\"eventsSection\"><div class=\"dateSection\">" + FilteredString[0] + "</div>"
        date.append(modifiedTitleString)
        modifiedLink = "\"" + link + "\""
        if FilteredString[1] == " SOLD OUT "
        {
            modifiedAnchorString = "<div class=\"eventNameSection\"><a href=" + modifiedLink + ">" + FilteredString[1] + "</a><br>Click on the SOLD OUT to know the event you missed!!!!!!!</div>"
        }
        else
        {
            modifiedAnchorString = "<div class=\"eventNameSection\"><a href=" + modifiedLink + ">" + FilteredString[1] + "</a><br>Click to know the event and grab the tickets to enjoy it!!!!</div>"
        }
        titleAndLink.append(modifiedAnchorString+"</div><br>")
    }
    
    //view will appear method
    override func viewWillAppear(animated: Bool) {
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.webview = webview
    }
    
    // this method is used to enabling networkActivityIndicator when webview is loading a webpage
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
    }
    
    // this method is used to disabling networkActivityIndicator when webview is loading a webpage
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
}

