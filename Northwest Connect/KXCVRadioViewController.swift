//
//  KXCWRadioViewController.swift
//  WebViewExample
//
//  Created by Kotu,Chiranjeevi Sneha on 4/8/16.
//  Copyright © 2016 Kotu,Chiranjeevi Sneha. All rights reserved.
//

import UIKit
import WebKit
import MediaPlayer

class KXCVRadioViewController: UIViewController {
    
    @IBOutlet weak var SwitchDayNight: UISwitch!
    
    @IBOutlet weak var Navigation: UINavigationBar!
   
    var webview:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        ////////
        
        
//        let height = Navigation.frame.height
//        let width = Navigation.frame.width
//        let x = Navigation.frame.origin.x + height
//        let y = Navigation.frame.origin.y + height
//        
        webview = WKWebView(frame: CGRectMake(100, 300,  250, 100))
        
        
        self.view.addSubview(webview!)
//        let url1 = NSURL(string: "http://www.shoutcast.com/media/popupPlayer_V19.swf?stationid=http://yp.shoutcast.com/sbin/tunein-station.pls?id=1652006&amp;play_status=1")
//        
       // var player:AVPlayer = AVPlayer(URL: NSURL(string: "http://www.kxcv.org/listenlive.htm")!)
        
        let kxcvURL = NSURL(string:"http://198.209.246.63:8000/listen.pls")
        //stsrt
        
       // player.play()
        // Do any additional setup after loading the view.
  webview?.loadRequest(NSURLRequest(URL: kxcvURL!))
        
        //var sp = sineplayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func backtoRadioController(sender: AnyObject) {
       
            self.dismissViewControllerAnimated(true, completion: nil)
     

    }

    @IBAction func DayNight(sender: AnyObject) {
        
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
