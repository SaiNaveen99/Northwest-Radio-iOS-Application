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
    
    //view will appear method
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = sportsData.sports[sportsData.sportSelected]
        let testUrl:NSURL = NSURL(string:sportsData.homelinks[sportsData.sportSelected])!
        let requestObj = NSURLRequest(URL: testUrl);
        webViewParsed.frame = self.view.frame
        webViewParsed.loadRequest(requestObj);
        webViewParsed.scalesPageToFit = true;
        
    }
    
    
}
