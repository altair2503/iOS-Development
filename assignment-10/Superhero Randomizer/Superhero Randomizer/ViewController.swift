import UIKit

struct SuperHero: Decodable {
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let image: Images
    
    struct Powerstats: Decodable {
        let intelligence: String
        let strength: String
        let speed: String
    }
    
    struct Appearance: Decodable {
        let gender: String
        let race: String
        let height: String
        let weight: String
    }
    
    struct Biography: Decodable {
        let aliases: [String]
    }
    
    struct Images: Decodable {
        let sm: String
    }

}

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroRaceGender: UILabel!
    @IBOutlet weak var heroAppearance: UILabel!
    @IBOutlet weak var heroPowerStats: UILabel!
    @IBOutlet weak var heroAliases: UILabel!
    let URLString = "https://akabab.github.io/superhero-api/api/all.json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRandomHero(_ sender: Any) {
        
    }
    
    private func fetchSuperHero() {
        let session = URLSession(configuration: .default)
        
        guard let url = URL(string: URLString) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            if let error {
                print("Error: \(error)")
            } else {
                guard let data else { return }
            }
        }
        
    }
    
    private func decodeSuperHeroData(data: Data) {
        do {
            let superheroes = try JSONDecoder().decode([SuperHero].self, from: data)
            guard let selectedSuperHero = superheroes.randomElement() else { return }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateUI(hero: SuperHero) {

    }
    
    
}

