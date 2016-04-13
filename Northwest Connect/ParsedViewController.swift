//
//  ParsedViewController.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 4/11/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit


class ParsedViewController: UIViewController , UIWebViewDelegate{
    
    var sportsData:SportsData!
    
    
    @IBOutlet weak var webViewParsed: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appy:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.sportsData = appy.sportsData
        webViewParsed.delegate = self
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationItem.title = sportsData.sports[sportsData.sportSelected] + " " + sportsData.sportsInfo[sportsData.sportInfoSelected] + " " + "Page"
        
        
        var testUrl:NSURL = NSURL(string:sportsData.homelinks[sportsData.sportSelected])!
       
        
        if(sportsData.sportInfoSelected == 0)
        {
             testUrl = NSURL(string:sportsData.homelinks[sportsData.sportSelected])!
        }
       else if(sportsData.sportInfoSelected == 1)
        {
            testUrl = NSURL(string:sportsData.schedulelinks[sportsData.sportSelected])!
        }
        else if(sportsData.sportInfoSelected == 2)
        {
            testUrl = NSURL(string:sportsData.rosterlinks[sportsData.sportSelected])!
        }
        else if(sportsData.sportInfoSelected == 3)
        {
            testUrl = NSURL(string:sportsData.statisticslinks[sportsData.sportSelected])!
        }
        else if(sportsData.sportInfoSelected == 3)
        {
            testUrl = NSURL(string:sportsData.archivedstorieslinks[sportsData.sportSelected])!
        }
        

        
       
        
        let requestObj = NSURLRequest(URL: testUrl);
        
        webViewParsed.frame = self.view.frame
        
       
        webViewParsed.loadRequest(requestObj);
        
         webViewParsed.scalesPageToFit = true;
        
        /* print("TestUrl\(testUrl)")
        var html = NSString()
        do {
            html = try NSString(contentsOfURL: testUrl!, encoding: NSUTF8StringEncoding)
        } catch{print(error)} */
       
       /*let htmlStarting = "<html><head></head><body>"
        let htmlEnding = "</body></html>"
        var parsedhtml:[String] = []
         let doc = HTML(html: html as String, encoding: NSUTF8StringEncoding)
         let nodes = doc!.css("#upcoming")
        print(nodes)
        for ele in nodes
        {
            print("element\(ele)")
           parsedhtml.append(ele.innerHTML!)
            
        }
        parsedhtml.insert(htmlStarting, atIndex: 0)
        parsedhtml.insert(htmlEnding, atIndex: parsedhtml.count-1)
        
        print(parsedhtml) */
     }
    
    
}
