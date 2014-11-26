//
//  RecordSoundViewController.swift
//  Learning Phonetics
//
//  Created by Serg on 11/25/14.
//  Copyright (c) 2014 sdbwebsolutions. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    
    //outlets
    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    
    //Declared Globally
    var audioRecorder:AVAudioRecorder!
    
    //Create a new object for this RecordedAudio
    var recordedAudio: RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //recordingLabel hidden by default, only enabled when record button is pressed
        recordingLabel.hidden = true
        
       
    }

    override func viewWillAppear(animated: Bool) {
        //when launch makes the stop button hide
        stopButton.hidden = true
        
        //enable recordButton again to let user start a new recording session
        recordButton.enabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func recordAudio(sender: UIButton) {
        //TODO: text recording in progress
        
        //TODO: record the user's voice
        println("Recording audio in progress...")
        
        recordingLabel.hidden = false
        //show stop button when recording audio action starts!
        stopButton.hidden = false
        
        //hide recordButton to avoid user accidentally press it more than once (the enable it on viewWillAppear)
        recordButton.enabled = false
        
        //TODO: Record the user's voice
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        //create an instance of the AVAudioRecorder class
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        
        //start recording
        audioRecorder.meteringEnabled = true
        audioRecorder.record()
        
        //set self as our delegate
         audioRecorder.delegate = self
    }
    
    
    
    
    @IBAction func stopRecording(sender: UIButton) {
        //println("I stopped recording!")
        recordingLabel.hidden = true
        
        
        //TODO: stop recording user's voice
        audioRecorder.stop()
        
        //Use this 2 lines to activate or deactivate your app’s audio session
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }

    func performSegue() {
        
    }
    
    //This function will be invoked when the audio has finished recording
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        //TODO: step1 save the recorded audio
        //I'm looking to save 2 things about the recorded audio:
        //the title of that file>> title: String!
        //and the path where to store it on the phone>> recordingFilePath: NSURL!
        //i'll do it by creating a new class called: RecordedAudio (this is the app model)
        
        //Initialize the new object
        recordedAudio = RecordedAudio()
        
        //TODO: step 2 move to the 2nd scene of the app and perform a segue
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






