//
//  NorthwestMediaViewController.swift
//  Northwest Connect
//
//  Created by Kola,Harish on 3/18/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit

class NorthwestMediaViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var MediaWV: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MediaWV.delegate = self
        let url = NSURL(string: "http://www.nwmissouri.edu/media/index.htm")
        let requestObj = NSURLRequest(URL: url!)
        MediaWV.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var activityIndicatorIV: UIActivityIndicatorView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

func webViewDidStartLoad(webView: UIWebView) {
    activityIndicatorIV.startAnimating()
}

func webViewDidFinishLoad(webView: UIWebView) {
    activityIndicatorIV.stopAnimating()
}

}