//
//  DetailedViewController.swift
//  Favorities
//
//  Created by Альтаир Кабдрахманов on 15.11.2024.
//

import UIKit

class DetailedViewController: UIViewController {
    var film: Film!
    var music: Music!
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if film != nil {
            self.coverImage.image = film.cover
            self.tittleLabel.text = film.title
            self.releaseLabel.text = "Release: " + film.release
            self.descriptionText.text = film.description
        } else {
            self.coverImage.image = music.cover
            self.tittleLabel.text = music.title
            self.releaseLabel.text = "Release: " + music.release
            self.descriptionText.text = music.description
        }

        
        
    }
}
