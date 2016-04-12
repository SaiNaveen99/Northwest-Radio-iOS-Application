//
//  ParsedViewController.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 4/11/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit


class ParsedViewController: UIViewController {
    
    var sportsTableData:SportsTableData = SportsTableData()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let testUrl = NSURL(string: sportsTableData.links[0])
        print("TestUrl\(testUrl)")
        var html = NSString()
        do {
            html = try NSString(contentsOfURL: testUrl!, encoding: NSUTF8StringEncoding)
        } catch{print(error)}
       
        let doc = HTML(html: html as String, encoding: NSUTF8StringEncoding)
         let parsedhtml = doc!.css("#upcoming")
        print(parsedhtml)
        
    }
    
    
}
