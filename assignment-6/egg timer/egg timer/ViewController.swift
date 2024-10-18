//
//  ViewController.swift
//  egg timer
//
//  Created by Альтаир Кабдрахманов on 16.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var timer: Timer?
    var counter: Int = 0 //Count the time from beginning
    var urlPath = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") //Path of sound url
    var player: AVPlayer! //player itself
    
    
    
    @IBOutlet weak var progressBar: UIProgressView! //outlet to progress
    @IBOutlet weak var remainingTime: UILabel! //outlet to remaining time
    
    @IBAction func selectEgg(_ sender: UIButton) { //pressed Egg function
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
        
        
        //put all variables to 0 values
        var duration: Int = 0
        self.counter = 0
        timer?.invalidate()
        self.progressBar.setProgress(0.0, animated: true)
        
        if let url = urlPath {
            player = AVPlayer(url: url)
        } else {
            print("Something went wrong")
        }
        
        switch sender.tag {
        case 0:
            duration = 300
        case 1:
            duration = 420
        case 2:
            duration = 720
        default:
            print("Something wrong")
        }
        
        //every interval in 1 seconds increases progress bar and if it reach max then play sound
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.counter += 1
            self.progressBar.setProgress((Float(self.counter)/Float(duration)), animated: true)
            self.remainingTime.text = "Remaining time for \(sender.tag == 0 ? "soft" : sender.tag == 1 ? "medium" : "well-done") egg: \(self.getRemainingTime(self.counter, duration))"
            
            
            if duration == self.counter { //when egg is ready
                self.counter = 0 //set 0 to counter
                timer.invalidate() //stop interval
                self.player.play() //play sound
            }
        })
    }
    
    func getRemainingTime(_ counter: Int, _ duration: Int) -> String {
        let remainingTime = duration - counter
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        
        let minutesString = String(format: "%02d", minutes)
        let secondsString = String(format: "%02d", seconds)
        
        return "\(minutesString):\(secondsString)"
    }

    
    

}

