//
//  ViewController.swift
//  Learning Phonetics
//
//  Created by admin 33 on 11/21/14.
//  Copyright (c) 2014 sdbwebsolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var recordingLabel: UILabel!

    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    }

    
    
    
    @IBAction func stopRecording(sender: UIButton) {
        recordingLabel.hidden = true
        
        println("I stopped recording!")
    }
    
    
    
    
    
}

