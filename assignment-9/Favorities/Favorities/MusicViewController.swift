//
//  MusicViewController.swift
//  Favorities
//
//  Created by Альтаир Кабдрахманов on 15.11.2024.
//

import UIKit

class MusicViewController: UIViewController {
    
    private var favoriteMusic: [Music] = [
        Music(
            cover: UIImage.m1,
            title: "Bohemian Rhapsody",
            release: "1975",
            description: "Queen’s epic rock opera, known for its ambitious structure and genre-blending style, became an iconic anthem in music history. It's a six-minute suite, incorporating operatic passages, hard rock sections, and memorable lyrics."
        ),
        Music(
            cover: UIImage.m2,
            title: "Hotel California",
            release: "1977",
            description: "The Eagles’ classic hit, famous for its haunting lyrics and intricate guitar solos, explores themes of excess and loss of innocence. Its evocative sound has cemented it as a timeless piece in rock music."
        ),
        Music(
            cover: UIImage.m3,
            title: "Imagine",
            release: "1971",
            description: "John Lennon’s anthem for peace and unity, ‘Imagine’ envisions a world free from divisions and conflict. Its simple yet profound lyrics have made it a universal symbol of hope and solidarity."
        ),
        Music(
            cover: UIImage.m4,
            title: "Stairway to Heaven",
            release: "1971",
            description: "Led Zeppelin’s iconic track is a powerful blend of rock and folk, with poetic lyrics that explore themes of life, spirituality, and personal growth. Known for its dynamic structure and epic guitar solo, it’s a classic rock staple."
        ),
        Music(
            cover: UIImage.m5,
            title: "Like a Rolling Stone",
            release: "1965",
            description: "Bob Dylan’s groundbreaking song transformed rock music with its introspective lyrics and biting commentary on society and identity. Often considered one of the greatest songs of all time, it marked a shift towards lyrical depth in popular music."
        ),
        Music(
            cover: UIImage.m6,
            title: "Purple Rain",
            release: "1984",
            description: "Prince’s emotional ballad is both a rock anthem and a soul-infused journey. With its powerful vocals and epic guitar solo, ‘Purple Rain’ has become one of Prince’s most celebrated songs, representing love, loss, and redemption."
        ),
        Music(
            cover: UIImage.m7,
            title: "Billie Jean",
            release: "1982",
            description: "Michael Jackson’s hit song ‘Billie Jean’ changed the landscape of pop music with its infectious bassline, memorable lyrics, and iconic music video. It remains one of the defining songs of the 1980s and a signature piece of Jackson’s legacy."
        ),
        Music(
            cover: UIImage.m8,
            title: "Smells Like Teen Spirit",
            release: "1991",
            description: "Nirvana’s grunge anthem became the voice of a generation, with its raw energy, angst-filled lyrics, and powerful guitar riffs. As the breakout single from ‘Nevermind,’ it played a significant role in bringing alternative rock to the mainstream."
        ),
        Music(
            cover: UIImage.m9,
            title: "Hey Jude",
            release: "1968",
            description: "The Beatles’ uplifting ballad is known for its sing-along chorus and message of encouragement. Written by Paul McCartney for John Lennon’s son, it’s become one of the band’s most beloved and enduring songs."
        ),
        Music(
            cover: UIImage.m10,
            title: "What's Going On",
            release: "1971",
            description: "Marvin Gaye’s soulful masterpiece reflects on themes of love, peace, and social justice. With its smooth vocals and introspective lyrics, ‘What’s Going On’ became an anthem for change and a landmark in soul music."
        )
    ]
    
    var selectedRow: Int = 0
    @IBOutlet weak var musicTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.musicTable.dataSource = self
        self.musicTable.delegate = self
    }

}


extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMusic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as! MusicViewCell
        cell.configure(with: favoriteMusic[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "detailedInfo", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedInfo" {
            guard let destination = segue.destination as? DetailedViewController else { return }
            destination.music = favoriteMusic[selectedRow]
        }
    }
}
