//
//  NorthwestAlumniViewController.swift
//  Northwest Connect
//
//  Created by Kola,Harish on 3/18/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit

class NorthwestAlumniViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var MediaWV: UIWebView!
    var goToAlumniTabBar:AlumniTabBarController!
    override func viewDidLoad() {
        super.viewDidLoad()
        goToAlumniTabBar = AlumniTabBarController()
        
//        goToAlumniTabBar = storyboard?.instantiateViewControllerWithIdentifier("LinkingToAlumniIdentifier") as! AlumniTabBarController
//        
//        self.view.window?.rootViewController = goToAlumniTabBar
//        
        
        //loadWebPage()
    }
    override func viewDidAppear(animated: Bool) {
        
        let AlumniTabViewController =   self.storyboard?.instantiateViewControllerWithIdentifier("LinkingToAlumniIdentifier") as! AlumniTabBarController
        self.view.window?.rootViewController = AlumniTabViewController
        
    }

    
//    func loadWebPage()
//    {
//        MediaWV.delegate = self
//        let url = NSURL(string: "http://www.nwmissouri.edu/media/index.htm")
//        let requestObj = NSURLRequest(URL: url!)
//        MediaWV.loadRequest(requestObj)
//
//    }

    @IBOutlet weak var activityIndicatorIV: UIActivityIndicatorView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func GoToAlumniAction(sender: AnyObject) {
        
       // loadWebPage()
        
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