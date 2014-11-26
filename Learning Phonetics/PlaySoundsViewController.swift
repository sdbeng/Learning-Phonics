//
//  PlaySoundsViewController.swift
//  Learning Phonetics
//
//  Created by Serg on 11/24/14.
//  Copyright (c) 2014 sdbwebsolutions. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //outlets
    
    @IBOutlet weak var stopPlaybackButton: UIButton!
    
    
    //Need to declare audioPlayer variable globally so I can use it inside function slowRecording. OJO!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //First method
        
        //Step1: Find path to audio file
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            //create an instance of AVAudioPlayer
            //work with this constructor: it takes in 2 args, 1 is called url which is of type NSURL,
            //but pathForResource is of type: String (not NSURL), so I have to convert the String to a type NSURL
            //init!(contentsOfURL url: NSURL!,error outError: NSErrorPointer)
            
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            
            //enable the rate variable so I can change the rate of the audio file
            audioPlayer.enableRate = true
            
        }else {
            println("File path is empty!")
        }
        
        //alternative method that works
        //this will try to find the URL location of the audio file or resource
        //        if var mysoundPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")!){
        //            var error:NSError?
        //            audioPlayer = AVAudioPlayer(contentsOfURL: filePath, error: &error)
        //
        //            //play slow audio
        //            audioPlayer.prepareToPlay()
        //            audioPlayer.play()
        //        }
        //
        //        else{
        //            println("File path is empty!")
        //        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This should be called slowPlayback, keep it in mind for a production stage
    @IBAction func slowRecording(sender: UIButton) {
        println("Playing slow recording snail file button...")
        
        helperdry()
        
        //Here I change rate before play audio - ranges from 0.5 to 2.0 (double playback)
        audioPlayer.rate = 0.5
        
    }
    
    
    //fast action button here
    
    @IBAction func fastPlayback(sender: UIButton) {
        println("Playing fast recording rabbit button...")
        
        helperdry()
        
        audioPlayer.rate = 1.5
       
    }
    
    //To avoid DRY, I can create a helper function to include all the repeatable code, like
    func helperdry() {
        //it's a good practice to always stop the playback before playing
        audioPlayer.stop()
        
        //another good practice to avoid playback overlaps, is set the currentTime to zero(0)
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
    }
    
    //Stop all audio playbacks
    @IBAction func stopPlaybacksButton(sender: UIButton) {
        
        println("I stopped all playbacks!")
        audioPlayer.stop()
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
