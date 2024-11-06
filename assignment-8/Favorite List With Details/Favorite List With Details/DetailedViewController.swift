//
//  DetailedViewController.swift
//  Favorite List With Details
//
//  Created by Альтаир Кабдрахманов on 08.11.2024.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var game: Game?
    
    @IBOutlet weak var gameTittle: UILabel!
    @IBOutlet weak var gamePlatformAndRelease: UILabel!
    @IBOutlet weak var gameDescription: UITextView!
    @IBOutlet weak var gameImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let game else { return }
        self.gameTittle.text = game.title
        self.gamePlatformAndRelease.text = "Platform: " + game.platform + ", release: " + game.release
        self.gameDescription.text = game.description
        self.gameImage.image = game.cover
    }
    
    @IBAction func returnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
