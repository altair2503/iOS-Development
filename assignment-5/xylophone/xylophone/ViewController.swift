//
//  ViewController.swift
//  xylophone
//
//  Created by Альтаир Кабдрахманов on 15.10.2024.
//

import UIKit
import AVFoundation //library for playing sounds

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var player: AVPlayer!
    
    //function that hanble pressed button
    @IBAction func handleButtonPress(_ sender: UIButton) {
        // To change opacity and scale
        UIView.animate(withDuration: 0.1, animations: {
            sender.alpha = 0.5
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            // Restore default parameters
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
                sender.transform = CGAffineTransform.identity
            }
        }
        
        //initialize variable
        var soundURL: URL?
        switch sender.tag{ //Based on tag assign soundURL
        case 0:
            soundURL = Bundle.main.url(forResource: "C", withExtension: "wav", subdirectory: "Sounds")
        case 1:
            soundURL = Bundle.main.url(forResource: "D", withExtension: "wav", subdirectory: "Sounds")
        case 2:
            soundURL = Bundle.main.url(forResource: "E", withExtension: "wav", subdirectory: "Sounds")
        case 3:
            soundURL = Bundle.main.url(forResource: "F", withExtension: "wav", subdirectory: "Sounds")
        case 4:
            soundURL = Bundle.main.url(forResource: "G", withExtension: "wav", subdirectory: "Sounds")
        case 5:
            soundURL = Bundle.main.url(forResource: "A", withExtension: "wav", subdirectory: "Sounds")
        case 6:
            soundURL = Bundle.main.url(forResource: "B", withExtension: "wav", subdirectory: "Sounds")
        default:
            print("Something wrong")
        }
        // assing soundURL to url to avoid nil
        if let url = soundURL {
            player = AVPlayer(url: url)
            player.play() //play sound
        } else {
            print("Something went wrong")
        }
    }


}

