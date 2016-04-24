//
//  KRCVRadioViewController.swift
//  WebViewExample
//
//  Created by Kotu,Chiranjeevi Sneha on 4/9/16.
//  Copyright © 2016 Kotu,Chiranjeevi Sneha. All rights reserved.
//

import UIKit
import WebKit

class KRCVRadioViewController: UIViewController {
    
    
    
    @IBOutlet weak var Navigation: UINavigationBar!
    
    @IBOutlet weak var SwitchDayNight: UISwitch!
    var webview:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
//        let height = Navigation.frame.height
//        let width = Navigation.frame.width
//        let x = Navigation.frame.origin.x + height
//        let y = Navigation.frame.origin.y + height
        
        webview = WKWebView(frame: CGRectMake(100, 300,  300, 100))
        self.view.addSubview(webview!)
        let krcvURL = NSURL(string: "http://198.209.246.162:8000/listen.pls")
        webview?.loadRequest(NSURLRequest(URL: krcvURL!))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    @IBAction func backtoRadio(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func Switch(sender: AnyObject) {
        
        if SwitchDayNight.on {
            view.backgroundColor = UIColor.whiteColor()
        }
        else {
            view.backgroundColor = UIColor.grayColor()
        }
        
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

