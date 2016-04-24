//
//  AlumniViewController.swift
//  Northwest Connect
//
//  Created by Harish Kola on 4/12/16.
//  Copyright © 2016 Kola,Harish. All rights reserved.
//
import UIKit
import WebKit
class AlumniViewController: UIViewController,UIPageViewControllerDataSource,WKNavigationDelegate {
    
    var images:NSArray!
    var links:[String]!
    var pageViewVC:UIPageViewController!
    var projectTabController:ProjectTabBarController!
    var appDelegate:AppDelegate!
    var webViewWV:WKWebView!
    var pageControlPC : UIPageControl = UIPageControl(frame: CGRectMake(50, 300, 200, 20))
    
    
    @IBOutlet weak var backBTN: UIBarButtonItem!
    
    //method for sharing the url to mail,whatsapp etc....
    @IBAction func shareAction(sender: AnyObject) {
        var sharingItems = [AnyObject]()
        sharingItems.append(webViewWV.URL!)
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        activityViewController.popoverPresentationController!.barButtonItem = sender as? UIBarButtonItem
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    //this method assigns the webview delegate to webViewWV when view is about to appear
    override func viewWillAppear(animated: Bool) {
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        webViewWV = appDelegate.webview
        webViewWV.navigationDelegate = self
        
    }
    
    // this method used to navigate to previous page when the user clicks on back button
    @IBAction func BackToHome(sender: AnyObject) {
        projectTabController = ProjectTabBarController()
        let rootVc = self.storyboard?.instantiateViewControllerWithIdentifier("projectTab") as! ProjectTabBarController
        rootVc.selectedViewController = rootVc.viewControllers![3]
        self.view.window?.rootViewController = rootVc
        
        webViewWV.goBack()
    }
    
    //view did load method
    override func viewDidLoad() {
        super.viewDidLoad()
        links = ["http://www.nwmissouri.edu/alumni/magazine/index.htm","http://calendar.nwmissouri.edu/feed.xml?c=52&days=30"]
        self.pageViewVC = self.storyboard?.instantiateViewControllerWithIdentifier("myPageViewController") as! UIPageViewController
        self.pageViewVC.dataSource = self
        let initialContenViewController = self.pageIndexOfviewController(0) as LatestNewsAndEventsViewController
        self.pageViewVC.setViewControllers([initialContenViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewVC.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-70)
        self.addChildViewController(self.pageViewVC)
        self.view.addSubview(self.pageViewVC.view)
        self.pageViewVC.didMoveToParentViewController(self)
        
        let proxy: UIPageControl = UIPageControl.appearanceWhenContainedInInstancesOfClasses([UIPageViewController.self])
        proxy.pageIndicatorTintColor = UIColor.lightGrayColor()
        proxy.currentPageIndicatorTintColor = UIColor.blackColor()
        proxy.backgroundColor = UIColor.whiteColor()
        
    }
    
    // configures the pagecontrol tint color and sets the number of pages in pagecontrol
    func configurePageControl() {
        self.pageControlPC.numberOfPages = 2
        self.pageControlPC.currentPage = 0
        self.pageControlPC.tintColor = UIColor.redColor()
        self.pageControlPC.pageIndicatorTintColor = UIColor.blackColor()
        self.pageControlPC.currentPageIndicatorTintColor = UIColor.greenColor()
        self.view.addSubview(pageControlPC)
    }
    
    
    // this method returns the view controller of pagecontrol
    func pageIndexOfviewController(index:Int)->LatestNewsAndEventsViewController
    {
        let pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("News") as! LatestNewsAndEventsViewController
        pageViewController.linkName = links[index]
        pageViewController.pageIndex = index
        return pageViewController
    }
    
    //this method returns the current view controller
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! LatestNewsAndEventsViewController
        var index = viewController.pageIndex as Int
        
        if(index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.pageIndexOfviewController(index)
    }
    
    //this method returns the current viewController
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! LatestNewsAndEventsViewController
        var index = viewController.pageIndex as Int
        
        if((index == NSNotFound))
        {
            return nil
        }
        
        index++
        if index ==  links.count
        {
            return nil
        }
        
        return self.pageIndexOfviewController(index)
        
    }
    
    //this method returns for the number of links in links array
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        // The number of items reflected in the page indicator.
        return links.count
    }
    
    //this method returns the present view controller index
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        // The selected item reflected in the page indicator.
        return 0
    }
    
    //Navigation for webview
    func addNavigation()
    {
        backBTN.enabled = webViewWV.canGoBack
        webViewWV.goBack()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
