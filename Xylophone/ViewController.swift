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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var player: AVAudioPlayer?
    
    @IBAction func keyPressed(_ sender: UIButton) {
        let label = sender.titleLabel?.text;
        //Reduces the sender's (the button that got pressed) opacity to half.
        playSound(label: label!)
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(label : String) {
        guard let url = Bundle.main.url(forResource: label, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url);
        player?.play()
    }
    
}

