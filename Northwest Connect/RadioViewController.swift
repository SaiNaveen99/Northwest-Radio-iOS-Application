//
//  RadioViewController.swift
//  Northwest Connect
//
//  Created by Kola,Harish on 3/18/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var KRNWWV: UIWebView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("testing")
        // Do any additional setup after loading the view, typically from a nib.
        
        //90.5
        KRNWWV.delegate = self
        //KRNWM.delegate = self
        let url = NSURL(string: "http://www.kxcv.org/listenlive.htm")
        let requestObj = NSURLRequest(URL: url!)
        print(requestObj)
        KRNWWV.loadRequest(requestObj)
//        
//        //KRNWM 88.9
//        let url2 = NSURL(string: "http://www.shoutcast.com/media/popupPlayer_V19.swf?stationid=http://yp.shoutcast.com/sbin/tunein-station.pls?id=214270&amp;play_status=0")
//        let requestObj1 = NSURLRequest(URL: url2!)
//        KRNWWV.loadRequest(requestObj1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

