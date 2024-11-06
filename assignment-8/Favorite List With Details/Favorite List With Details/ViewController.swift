import UIKit

class ViewController: UIViewController {
    
    private var favoriteGames: [Game] = [
        Game(
            cover: UIImage.theLastOfUs,
            title: "The Last of Us",
            platform: "PS4",
            release: "2014",
            description: "The Last of Us Remastered is a critically acclaimed action-adventure game set in a post-apocalyptic world where a fungal infection has decimated humanity. Players control Joel, a seasoned survivor, and Ellie, a young girl immune to the infection, as they journey across the United States. With intense combat, stealth elements, and an emotional storyline, players navigate through hostile environments and face threats from both the infected and other survivors. This remastered version for PS4 features enhanced graphics and smoother gameplay, providing a more immersive experience. The game explores themes of survival, trust, and sacrifice, with unforgettable character development and interactions. It remains a landmark title for its emotional depth and narrative quality, creating a lasting impact in the realm of story-driven games."
        ),
        Game(
            cover: UIImage.bloodbornePng,
            title: "Bloodborne",
            platform: "PS4",
            release: "2015",
            description: "Bloodborne is an action RPG from the creators of Dark Souls, set in the Gothic-inspired city of Yharnam, where players are Hunters fighting against a plague that turns people into nightmarish creatures. The game emphasizes fast-paced combat, encouraging aggressive play with risk-reward mechanics, as players hunt down monsters and uncover dark secrets. As players progress, they face challenging bosses, each requiring mastery of dodging and counterattacks. Bloodborne’s story unfolds subtly through environmental details, NPC interactions, and cryptic lore, inspired by H.P. Lovecraft. The game is widely praised for its atmosphere, gameplay mechanics, and intense difficulty, standing out as one of the best action RPGs on the PS4 and an unforgettable experience in dark fantasy."
        ),
        Game(
            cover: UIImage.spiderMan,
            title: "Marvel's Spider-Man",
            platform: "PS4",
            release: "2018",
            description: "Marvel’s Spider-Man lets players swing through New York City as Peter Parker, balancing his responsibilities as a young man and a superhero. The game captures Spider-Man’s essence with fluid web-swinging mechanics, dynamic combat, and encounters with iconic villains like the Kingpin and Mr. Negative. Players experience the thrill of Spider-Man’s double life, managing relationships and facing personal challenges that shape him as a hero. The game features a rich storyline, blending humor, heart, and high-stakes action, bringing Peter Parker’s world to life. Its stunning visuals, compelling narrative, and engaging gameplay make it a benchmark in superhero games, offering fans an immersive experience in the Spider-Man universe."
        ),
        Game(
            cover: UIImage.godOfWar,
            title: "God of War",
            platform: "PS4",
            release: "2018",
            description: "God of War (2018) reinvents the series by introducing players to Norse mythology and a more personal, emotional storyline centered on Kratos and his son, Atreus. The game shifts from Greek gods to Norse deities, with a combat system that feels fresh, focusing on Kratos’s powerful Leviathan Axe and strategic, close-quarters combat. Players navigate stunning landscapes filled with mythical creatures, challenging bosses, and puzzles that deepen the world’s lore. The narrative explores themes of fatherhood, legacy, and redemption, showing a more vulnerable side of Kratos. With its blend of intense action and heartfelt storytelling, God of War is celebrated for its artistry, innovative design, and depth, making it a masterpiece on the PS4."
        ),
        Game(
            cover: UIImage.horizon,
            title: "Horizon Zero Dawn",
            platform: "PS4",
            release: "2017",
            description: "Horizon Zero Dawn is an open-world action RPG set in a world reclaimed by nature, where robotic creatures roam and humanity has returned to tribal societies. Players control Aloy, a skilled hunter seeking to uncover the mysteries of her past while battling both humans and robotic foes. Equipped with a bow, traps, and special technology, Aloy uses strategy and skill to hunt machines, each with unique behaviors and weaknesses. The game’s story delves into themes of technology, survival, and discovery, revealing a rich backstory through exploration and quests. Known for its beautiful landscapes, innovative gameplay, and compelling protagonist, Horizon Zero Dawn offers a unique blend of sci-fi and fantasy, making it a standout title in the genre."
        ),
        Game(
            cover: UIImage.starWars,
            title: "Star Wars Battlefront",
            platform: "PS4, XBOX ONE, Windows",
            release: "2015",
            description: "Star Wars Battlefront brings the iconic Star Wars universe to life with massive multiplayer battles and stunning visuals. Players can fight on various planets, piloting starfighters, controlling iconic characters, and battling for the Rebel Alliance or the Galactic Empire. The game offers a range of modes, from large-scale warfare to smaller, intense skirmishes, all set in well-known Star Wars locations like Hoth and Endor. While primarily multiplayer-focused, Battlefront captures the look and feel of the Star Wars franchise, delivering authentic sound effects, vehicles, and character designs. With its emphasis on capturing the essence of Star Wars battles, this game appeals to fans who want an immersive experience in George Lucas’s galaxy."
        ),
        Game(
            cover: UIImage.infamous,
            title: "Infamous Second Son",
            platform: "PS4",
            release: "2014",
            description: "Infamous Second Son follows Delsin Rowe, a young man with superhuman abilities in a world where 'Conduits' are hunted by the government. Set in an open-world Seattle, players use Delsin’s powers, which range from smoke manipulation to neon energy, to explore the city, fight enemies, and make choices that affect the story. The game emphasizes player choice, allowing players to be a hero or anti-hero, influencing both the storyline and Delsin’s powers. With visually impressive environments, fluid parkour mechanics, and exciting combat, Infamous Second Son offers a thrilling superhero experience, letting players harness unique powers while navigating moral dilemmas."
        ),
        Game(
            cover: UIImage.beyondTwoSouls,
            title: "Beyond: Two Souls",
            platform: "PS3, PS4",
            release: "2013",
            description: "Beyond: Two Souls is a narrative-driven interactive drama that explores themes of life, death, and the supernatural. Players experience the life of Jodie Holmes, a woman connected to a mysterious entity named Aiden. Through Jodie’s journey, players make choices that shape her relationships and the story’s outcome, exploring her life from childhood to adulthood. The game features advanced motion capture technology, with performances by Ellen Page and Willem Dafoe, bringing an immersive cinematic quality to the storytelling. With its focus on character development and moral choices, Beyond: Two Souls delivers an emotional, thought-provoking experience that challenges players to reflect on destiny and human connection."
        ),
        Game(
            cover: UIImage.battlefield,
            title: "Battlefield Hardline",
            platform: "PS4, XBOX ONE, Windows",
            release: "2015",
            description: "Battlefield Hardline shifts from traditional military settings to a cops-and-robbers theme, putting players in the role of Nick Mendoza, a detective navigating a world of crime and corruption. The game offers a unique perspective within the Battlefield franchise, with a focus on urban warfare, heists, and high-speed car chases. Players engage in tactical gameplay, choosing between lethal and non-lethal approaches in single-player, and competing in multiplayer modes that highlight team dynamics. Hardline’s diverse environments, vehicles, and intense gameplay provide an engaging twist on the Battlefield experience, offering fans a fresh take on action-packed crime drama."
        ),
        Game(
            cover: UIImage.detroit,
            title: "Detroit: Become Human",
            platform: "PS4",
            release: "2018",
            description: "Detroit: Become Human is an interactive drama that explores the ethical implications of AI and humanity. Set in a near-future Detroit, players follow three androids—Connor, Markus, and Kara—as they navigate a society divided on android rights. Each character’s story is influenced by player choices, shaping the narrative’s outcome and exploring complex themes like freedom, empathy, and prejudice. With its branching storylines, Detroit offers immense replayability, allowing players to see different outcomes based on their decisions. The game’s lifelike visuals, detailed environments, and moral dilemmas make it an immersive, thought-provoking journey into the future of artificial intelligence and human relationships."
        )
    ]
    var selectedRow: Int = 0

    @IBOutlet weak var gameTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameTable.dataSource = self
        gameTable.delegate = self
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.configure(with: favoriteGames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "detailedGameInfo", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedGameInfo" {
            guard let destinationVC = segue.destination as? DetailedViewController else { return }
            destinationVC.game = favoriteGames[selectedRow]
            
        }
    }
    
    
}
