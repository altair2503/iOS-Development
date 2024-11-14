import UIKit

class FilmViewController: UIViewController {

    private var favoriteFilms: [Film] = [
        Film(
            cover: UIImage.theGodfather,
            title: "The Godfather",
            release: "1972",
            description: "The Godfather is a timeless crime drama that explores the powerful Italian-American crime family of Don Vito Corleone. As Michael Corleone, the youngest son, reluctantly joins the family business, the story delves into themes of loyalty, power, and the consequences of violence. Directed by Francis Ford Coppola, the film is acclaimed for its masterful storytelling, memorable performances, especially by Marlon Brando and Al Pacino, and its profound influence on cinema. Its portrayal of the mafia’s inner workings and moral complexity has made it a cinematic classic."
        ),
        Film(
            cover: UIImage.theShawshankRedemption,
            title: "The Shawshank Redemption",
            release: "1994",
            description: "The Shawshank Redemption tells the inspiring story of Andy Dufresne, a banker wrongly imprisoned for murder, and his friendship with fellow inmate Red. Through perseverance and hope, Andy transforms the lives of those around him within the walls of Shawshank Prison. With standout performances by Tim Robbins and Morgan Freeman, this film explores themes of redemption, friendship, and resilience. Known for its emotional depth and powerful narrative, it is widely regarded as one of the greatest films of all time."
        ),
        Film(
            cover: UIImage.inception,
            title: "Inception",
            release: "2010",
            description: "Inception is a sci-fi thriller that follows Dom Cobb, a skilled thief who steals secrets from within the subconscious. Given a chance at redemption, he must perform the ultimate heist: planting an idea within a target’s mind. Directed by Christopher Nolan, Inception is known for its complex, layered plot, stunning visuals, and mind-bending action sequences. With a talented ensemble cast led by Leonardo DiCaprio, the film explores themes of reality, dreams, and the power of the subconscious, making it a groundbreaking and thought-provoking experience."
        ),
        Film(
            cover: UIImage.theDarkKnight,
            title: "The Dark Knight",
            release: "2008",
            description: "The Dark Knight is a superhero crime drama that pits Batman against his ultimate nemesis, the Joker, who seeks to create chaos in Gotham City. Directed by Christopher Nolan, the film is celebrated for its mature themes, compelling narrative, and Heath Ledger’s unforgettable, Oscar-winning performance as the Joker. With moral dilemmas, intense action, and iconic characters, The Dark Knight is widely considered one of the best superhero films ever made, exploring the boundaries between good and evil."
        ),
        Film(
            cover: UIImage.fightClub,
            title: "Fight Club",
            release: "1999",
            description: "Fight Club is a dark psychological thriller about a disillusioned man who forms an underground fight club as a form of rebellion against consumer culture. Directed by David Fincher and starring Brad Pitt and Edward Norton, the film delves into themes of identity, masculinity, and societal discontent. With its unique storytelling, twists, and critique of modern society, Fight Club has become a cult classic, sparking discussion and analysis of its themes and messages."
        ),
        Film(
            cover: UIImage.forrestGump,
            title: "Forrest Gump",
            release: "1994",
            description: "Forrest Gump is a heartwarming drama following the life of Forrest, a man with a low IQ but a kind heart, who inadvertently influences historical events and achieves extraordinary things. Starring Tom Hanks, the film explores themes of destiny, love, and the human spirit. Through Forrest’s perspective, viewers experience the 20th century’s defining moments, making it both a nostalgic and inspirational journey. Its blend of humor, tragedy, and optimism has made Forrest Gump a beloved classic."
        ),
        Film(
            cover: UIImage.pulpFiction,
            title: "Pulp Fiction",
            release: "1994",
            description: "Pulp Fiction is a stylistic crime drama directed by Quentin Tarantino, known for its nonlinear narrative and eclectic characters. The film interweaves multiple storylines involving crime, redemption, and morality, with memorable performances by John Travolta, Uma Thurman, and Samuel L. Jackson. Its witty dialogue, dark humor, and unique storytelling structure have made it a landmark in independent cinema, influencing generations of filmmakers and securing its place as a cult classic."
        ),
        Film(
            cover: UIImage.schindlersList,
            title: "Schindler's List",
            release: "1993",
            description: "Schindler’s List is a historical drama directed by Steven Spielberg, telling the true story of Oskar Schindler, a businessman who saved over a thousand Jewish lives during the Holocaust. The film’s powerful depiction of human compassion amidst horror, combined with haunting cinematography, makes it an unforgettable and deeply moving experience. With exceptional performances and a heart-wrenching story, Schindler’s List is regarded as one of the most impactful films ever made, serving as a reminder of the atrocities of war and the strength of the human spirit."
        ),
        Film(
            cover: UIImage.avatar,
            title: "Avatar",
            release: "2009",
            description: "Avatar is a sci-fi epic set on the lush alien planet of Pandora, where humans seek to exploit its resources. Jake Sully, a paraplegic ex-marine, becomes involved with the native Na’vi and their way of life, ultimately facing a choice between his own people and the Na’vi. Directed by James Cameron, the film is celebrated for its groundbreaking visual effects, immersive 3D experience, and environmental themes. Avatar’s innovative technology and stunning visuals make it a landmark in cinematic history."
        ),
        Film(
            cover: UIImage.theMatrix,
            title: "The Matrix",
            release: "1999",
            description: "The Matrix is a sci-fi action film that follows Neo, a hacker who discovers the world is a simulated reality controlled by machines. With its innovative special effects, including the iconic bullet-dodging scenes, The Matrix explores themes of reality, freedom, and self-discovery. Directed by the Wachowskis, it has had a profound impact on both pop culture and filmmaking, praised for its philosophical depth, action choreography, and visual storytelling."
        )
    ]
    var selectedRow: Int = 0
    
    @IBOutlet weak var filmTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filmTable.delegate = self
        self.filmTable.dataSource = self
    }

}

extension FilmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        cell.configure(with: favoriteFilms[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "detailedInfo", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedInfo" {
            guard let destination = segue.destination as? DetailedViewController else {return}
            destination.film = favoriteFilms[selectedRow]
        }
    }
}
