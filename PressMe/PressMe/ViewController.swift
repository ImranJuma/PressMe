//
//  ViewController.swift
//  PressMe
//
//  Created by Imran Juma on 2018-04-12.
//  Copyright © 2018 Imran Juma. All rights reserved.
//

// Within this application we have also added constains so that no matter what device you are using, you will be able to see the application just fine 

import UIKit

// Here we are just importing the frame work that we have added so that we can use it within our application, this is important to esablish as we are exploring different ways to use frameworks
import AVFoundation

class ViewController: UIViewController {
    
    // Here I have my outlet for my lable
    @IBOutlet weak var button: UIButton!
    
    // Here I have my outlet for my button
    @IBOutlet weak var lable: UILabel!
    
    // Here we will create a varible for out audio-file that way we can use it as refrence within the application, this iwll use the refrence from our added framework
    var catSound: AVAudioPlayer = AVAudioPlayer()
    

    
    // ** Just For Refrence **
    // Here, anything that is put here, will be loaded when the applications runs for the first time, keep this is mind for refrence when building your application
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // making the lable hidden when the application is first loaded
        lable.isHidden = true
        
        // This will scale the button, within the frame. Because we used AspectFit for the walpaper, we would want to do the same with the button so it all looks nice and flush!
        button.imageView?.contentMode = .scaleAspectFit
        
        // Here we will create a constant for our sound, we are creating a path so that we can find our sound file within the bundle and also telling what type of file it is, hee we have the file name listed as "Cat" and the file name listed as "wav"
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        
        // Because we have used a do and try statement we must also have a catch statement to go along with it, here we have created a debugging statement, that way if there ever is an error, that we will print the following within the consol so we can see it for refrence.
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Here I have my action for when the cat has been pressed
    @IBAction func meow(_ sender: Any) {
        
        //This will play the cat sound that we have made.
        catSound.play()
        
        // This will make the lable show when the user presses the button
        lable.isHidden = false
        
        // Here we are creating a timer to call upon the function after x amount of time, to allow for the text to appear when the button is pressed, and then brifely disappear
        // Alot of the configureatiins are pre made!
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLable), userInfo: nil, repeats: false)
    }
    
    // Here, we are creating an a function for when we should hide/not hide the meow function, meaning when it is pressed, briefly show the text, but then remove it after
    // Here we need to add @objc so that way our #selector method can read it within an objective C method
    @objc func hideLable() {
        lable.isHidden = true
        
    }
}
