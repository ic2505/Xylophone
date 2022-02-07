//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        let dur : TimeInterval = 0.2
        
        // smoother transition
        //Reduces the sender's (the button that got pressed) opacity to half in a smooth way
        UIView.animate(withDuration: dur) {
            sender.alpha = 0.5
        }
        
        //Code should execute after 0.3 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + dur ) {
            //Bring's sender's opacity back up to fully opaque in a smooth transition.
            UIView.animate(withDuration: dur) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

