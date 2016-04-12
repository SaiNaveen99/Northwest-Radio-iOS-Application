//
//  ParsedViewController.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 4/11/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit


class ParsedViewController: UIViewController {
    
    let sportsTableData:SportsTableData = SportsTableData()
    
    
    @IBOutlet weak var webViewParsed: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let testUrl = NSURL(string:sportsTableData.schedulelinks[0])
        
        let requestObj = NSURLRequest(URL: testUrl!);
        
       
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
