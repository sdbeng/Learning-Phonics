//
//  PlaySoundsViewController.swift
//  Learning Phonetics
//
//  Created by admin 33 on 11/24/14.
//  Copyright (c) 2014 sdbwebsolutions. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //outlets
    
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
    
    @IBAction func slowRecording(sender: UIButton) {
        println("Pressed slow recording file button (snail)...")
        
        //it's a good practice to always stop the playback before playing
        audioPlayer.stop()
        
        //Here I change rate before play audio - ranges from 0.5 to 2.0 (double playback)
        audioPlayer.rate = 0.5
        
        audioPlayer.play()
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
