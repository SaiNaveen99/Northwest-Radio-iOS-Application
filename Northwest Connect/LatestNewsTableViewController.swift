//
//  LatestNewsTableViewController.swift
//  Northwest Connect
//
//  Created by Kola,Harish on 4/1/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit
import WebKit
class LatestNewsTableViewController: UIViewController {
    var alumniHomeViewController:NorthwestAlumniViewController!
    var projectTabBarController:ProjectTabBarController!

    
    
    @IBAction func BackToAlumniPage(sender: AnyObject) {
        
         print("back action")
//        let tabBarController = self.storyboard?.instantiateViewControllerWithIdentifier("AlumniIdentifier") as! NorthwestAlumniViewController
//
//         self.view.window?.rootViewController = tabBarController
//        print("completed")
       self.dismissViewControllerAnimated(true, completion: nil)
        
    //self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        alumniHomeViewController = NorthwestAlumniViewController()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url1 = NSURL(string:"http://www.kinderas.com/")
        _ = NSURLRequest(URL:url1!)
        //self.latestNewsWV!.loadRequest(req)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
