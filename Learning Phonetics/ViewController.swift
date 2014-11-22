//
//  ViewController.swift
//  Learning Phonetics
//
//  Created by admin 33 on 11/21/14.
//  Copyright (c) 2014 sdbwebsolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //recordingLabel hidden by default, only enabled when record button is pressed
        recordingLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func recordAudio(sender: UIButton) {
        //TODO: text recording in progress
        
        //TODO: record the user's voice
        println("print record audio in progress...")
        
        recordingLabel.hidden = false
    }

    @IBOutlet weak var recordingLabel: UILabel!
    
    
    @IBAction func stopRecording(sender: UIButton) {
        recordingLabel.hidden = true
        
        println("I stopped recording!")
    }
    
    
    
    
    
}

