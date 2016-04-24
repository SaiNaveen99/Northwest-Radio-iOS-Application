//
//  SportsViewController.swift
//  Northwest Connect
//
//

import WebKit

class MissourianViewController: UIViewController {
    
    @IBOutlet weak var webContainerView: UIWebView!
    var webViewWV: WKWebView?
    
    
    override func loadView() {
        super.loadView()
        self.webViewWV = WKWebView()
        self.view = self.webViewWV
        
    }
    
    
    //view did load method
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.nwmissourinews.com/")
        let req = NSURLRequest(URL: url!)
        self.webViewWV!.loadRequest(req)
}


}





