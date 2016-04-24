//
//  RadioViewController.swift
//  Northwest Connect
//
//  Created by Kotu,Chiranjeevi Sneha on 3/18/16.
//  Copyright © 2016 Kotu,Chiranjeevi Sneha. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class RadioViewController: UIViewController,UIWebViewDelegate,MPMediaPickerControllerDelegate
{
    
    var streakToner:NSTimer!
    var splashTimer:NSTimer!
    var RadioOneToggleState = true
    var RadioTwoToggleState = true
    var player:AVPlayer!
    let particleEmitter = CAEmitterLayer()
    
    @IBOutlet weak var radioTwoButton: UIButton!
    
    @IBOutlet weak var radioOneButton: UIButton!
    
    @IBOutlet weak var backroundLayer: UIImageView!
    
    let KXCV_URI_STRING = "http://198.209.246.162:8000/listen.pls"
    
    let KRNW_URI_STRING = "http://198.209.246.63:8000/listen.pls"
    var activeStateUrl:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error as NSError {
                print(error)
            }
        } catch let error as NSError {
            print(error)
        }
        activeStateUrl = KXCV_URI_STRING
        defaultVisualizer()
    }
    
    
    //this method used to share the url of radio station to email
    @IBAction func ShareLinkAction(sender: UIBarButtonItem) {
        var sharingItems = [AnyObject]()
        //Share Text
        sharingItems.append("I Like this Station!")
        //Share Current playing URL
        sharingItems.append(activeStateUrl)
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        activityViewController.popoverPresentationController!.barButtonItem = sender
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    
    // playing radio when user clicks on play button
    @IBAction func playRadioOneAction(playBTN: UIButton) {
        if Reachability.isConnectedToNetwork() {
            if !RadioTwoToggleState {
                radioTwoButton.setImage(UIImage(named:"Circled Play-48.png"),forState:UIControlState.Normal)
                RadioTwoToggleState = !RadioTwoToggleState
            }
            if RadioOneToggleState  {
                
                activeStateUrl = KXCV_URI_STRING
                player = AVPlayer(URL: NSURL(string: activeStateUrl)!)
                streakToner = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "particleStreak", userInfo: nil, repeats: true)
                
                playBTN.setImage(UIImage(named:"Stop-48.png"),forState:UIControlState.Normal)
                
                createParticlesStreak()
                
                player.play()
                
            } else {
                playBTN.setImage(UIImage(named:"Circled Play-48.png"),forState:UIControlState.Normal)
                
                // Stop the timer
                streakToner.invalidate()
                
                //Reset to default Visualizer to normal state
                defaultVisualizer()
                player.pause()
            }
            
            RadioOneToggleState = !RadioOneToggleState
            
        }
        else
        {
            showNetworkError()
        }
    }
    
    //playing second radio station when  user clicks on second radio station play button
    @IBAction func playRadioTwoAction(playBTN: UIButton) {
        
        if Reachability.isConnectedToNetwork() {
            
            if !RadioOneToggleState {
                
                radioOneButton.setImage(UIImage(named:"Circled Play-48.png"),forState:UIControlState.Normal)
                RadioOneToggleState = !RadioOneToggleState
                
            }
            if RadioTwoToggleState  {
                activeStateUrl = KRNW_URI_STRING
                player = AVPlayer(URL: NSURL(string: activeStateUrl)!)
                
                streakToner = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "particleStreak", userInfo: nil, repeats: true)
                
                playBTN.setImage(UIImage(named:"Stop-48.png"),forState:UIControlState.Normal)
                
                createParticlesStreak()
                
                player.play()
                
            } else {
                playBTN.setImage(UIImage(named:"Circled Play-48.png"),forState:UIControlState.Normal)
                
                
                streakToner.invalidate()
                
                //Reset to default Visualizer to normal state
                defaultVisualizer()
                player.pause()
            }
            RadioTwoToggleState = !RadioTwoToggleState
            
        }
        else
        {
            showNetworkError()
        }
        
    }
    
    
    //this method used to display the animated particles
    func particleStreak(){
        
        let randomScale = randomBetweenNumbers(0.1, secondNum: 1.0)
        let randomVelocity = randomBetweenNumbers(100, secondNum: 2000)
        let randomlifeTime = randomBetweenNumbers(0, secondNum: 2)
        let randomBirthRate = randomBetweenNumbers(1, secondNum: 1500)
        
        particleEmitter.setValue(randomScale, forKeyPath: "emitterCells.cell.emitterCells.childCell.scale")
        particleEmitter.setValue(randomlifeTime, forKeyPath: "emitterCells.cell.emitterCells.childCell.lifetime")
        particleEmitter.setValue(randomBirthRate, forKeyPath: "emitterCells.cell.emitterCells.childCell.birthRate")
        particleEmitter.setValue(randomVelocity, forKeyPath: "emitterCells.cell.emitterCells.childCell.velocity")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this method creates the particles
    func createParticles() {
        
        particleEmitter.emitterPosition = CGPoint(x:self.view.center.x, y: self.view.frame.height-250)
        particleEmitter.emitterSize = CGSizeMake(self.view.frame.width,self.view.frame.height/2);
        particleEmitter.emitterShape = kCAEmitterLayerRectangle;
        particleEmitter.renderMode = kCAEmitterLayerAdditive;
        particleEmitter.shouldRasterize=true
        
        let emmitterCell = CAEmitterCell()
        emmitterCell.name = "cell"
        
        let childCell = CAEmitterCell()
        childCell.name = "childCell"
        childCell.lifetime = 1.0 / 30.0;
        childCell.birthRate = 60.0;
        childCell.velocity = 3.0;
        
        
        childCell.contents = UIImage(named: "particleTexture.png")?.CGImage
        
        emmitterCell.emitterCells = [childCell]
        
        emmitterCell.color = UIColor(red: 1.0, green: 0.53, blue: 0.0, alpha: 0.8).CGColor
        
        
        emmitterCell.redRange = 0.46;
        emmitterCell.greenRange = 0.4;
        emmitterCell.blueRange = 0.67;
        emmitterCell.alphaRange = 0.55;
        
        emmitterCell.redSpeed = 0.11
        emmitterCell.greenSpeed = 0.07
        emmitterCell.blueSpeed = -0.25
        emmitterCell.alphaSpeed = 0.15
        
        emmitterCell.scale = 0.1
        emmitterCell.scaleRange = 0.5
        
        emmitterCell.lifetime = 0.5
        emmitterCell.lifetimeRange = 5.0
        emmitterCell.birthRate = 70
        
        emmitterCell.velocity = 6.0
        emmitterCell.velocityRange = 200.0
        emmitterCell.emissionRange = CGFloat(M_PI) * CGFloat(2)
        
        particleEmitter.emitterCells=[emmitterCell]
        self.view.layer.insertSublayer(particleEmitter, below: backroundLayer.layer )
        
    }
    
    //this method creates particles streak
    func createParticlesStreak() {
        
        particleEmitter.emitterPosition = CGPoint(x:self.view.center.x, y: self.view.frame.height-250)
        particleEmitter.emitterSize = CGSizeMake(self.view.frame.width,self.view.frame.height/2);
        particleEmitter.emitterShape = kCAEmitterLayerAdditive;
        particleEmitter.renderMode = kCAEmitterLayerAdditive;
        particleEmitter.shouldRasterize=true
        let emmitterCell = CAEmitterCell()
        emmitterCell.name = "cell"
        
        let childCell = CAEmitterCell()
        childCell.name = "childCell"
        childCell.lifetime = 1.0 / 30.0;
        childCell.birthRate = 60.0;
        childCell.velocity = 3.0;

        childCell.contents = UIImage(named: "particleTexture.png")?.CGImage
        
        emmitterCell.emitterCells = [childCell]
        
        emmitterCell.color = UIColor(red: 1.0, green: 0.53, blue: 0.0, alpha: 0.8).CGColor
        
        emmitterCell.redRange = 0.46;
        emmitterCell.greenRange = 0.4;
        emmitterCell.blueRange = 0.67;
        emmitterCell.alphaRange = 0.55;
        
        emmitterCell.redSpeed = 0.11
        emmitterCell.greenSpeed = 0.07
        emmitterCell.blueSpeed = -0.25
        emmitterCell.alphaSpeed = 0.15
        
        emmitterCell.scale = 0.1
        emmitterCell.scaleRange = 0.5
        
        emmitterCell.lifetime = 0.5
        emmitterCell.lifetimeRange = 5.0
        emmitterCell.birthRate = 70
        
        emmitterCell.velocity = 6.0
        emmitterCell.velocityRange = 200.0
        emmitterCell.emissionRange = CGFloat(M_PI) * CGFloat(2)
        
        particleEmitter.emitterCells=[emmitterCell]
        self.view.layer.insertSublayer(particleEmitter, below: backroundLayer.layer )
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func defaultVisualizer(){
        particleEmitter.removeFromSuperlayer()
        createParticles()
    }
    
    func showNetworkError(){
        let alertView = UIAlertController(title: "No Internet", message: "No active network connection found.", preferredStyle: .Alert)
        
        alertView.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    }
    
    //declare instance variable
    var audioRecorder:AVAudioRecorder!
    
    func record() {
        let audioSession:AVAudioSession = AVAudioSession.sharedInstance()
        //ask for permission
        if (audioSession.respondsToSelector("requestRecordPermission:")) {
            AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
                if granted {
                    
                    //set category and activate recorder session
                    try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    try! audioSession.setActive(true)
                    
                    
                    //get documnets directory
                    let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
                    let url = NSURL(fileURLWithPath:documentsDirectory).URLByAppendingPathComponent("radiorecording.caf")
                    
                    //create AnyObject of settings
                    let settings: [String : AnyObject] = [
                        AVFormatIDKey:Int(kAudioFormatAppleIMA4), //Int required in Swift2
                        AVSampleRateKey:44100.0,
                        AVNumberOfChannelsKey:2,
                        AVEncoderBitRateKey:12800,
                        AVLinearPCMBitDepthKey:16,
                        AVEncoderAudioQualityKey:AVAudioQuality.Max.rawValue
                    ]
                    
                    //record
                    try! self.audioRecorder = AVAudioRecorder(URL: url, settings: settings)
                    
                } else{
                }
            })
        }
        
    }
    
    
}



   