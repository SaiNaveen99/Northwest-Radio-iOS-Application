//
//  SportsViewController.swift
//  Northwest Connect
//
//  Created by Mallampati,Sai Naveen on 4/15/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var sportsdata:SportsData = SportsData()
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let app:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.sportsdata = app.sportsData
        imageView.image = UIImage(named: "sportscover.jpg")
       tabView.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //defines the cell contents
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("sports_cell", forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor.greenColor()
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = sportsdata.sports[indexPath.row]
        return cell
    }
    
    //setting height for cell
   func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return 50.00
    }
    
    //setting header title for sections in a table
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Categories"
    }
    
    //returns the number for rows in a section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return sportsdata.sports.count
    }
    
    //this method executes when user select a row in a section
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            sportsdata.sportSelected = indexPath.row
    }
    
    

   
    


}
