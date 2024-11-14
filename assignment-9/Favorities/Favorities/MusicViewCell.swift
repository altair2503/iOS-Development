//
//  MusicViewCell.swift
//  Favorities
//
//  Created by Альтаир Кабдрахманов on 15.11.2024.
//

import UIKit

class MusicViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with music: Music) {
        coverImage.image = music.cover
        titleLabel.text = music.title
        releaseLabel.text = music.release
    }

}
