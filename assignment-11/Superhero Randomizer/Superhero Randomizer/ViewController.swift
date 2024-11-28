import UIKit
import Alamofire
import Kingfisher

struct SuperHero: Decodable {
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Images

    struct Powerstats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
    }

    struct Appearance: Decodable {
        let gender: String?
        let race: String?
        let height: [String]
        let weight: [String]
    }

    struct Biography: Decodable {
        let aliases: [String]
    }

    struct Images: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {
    // Main properties
    var superheroes: [SuperHero] = []
    
    @IBOutlet weak var heroText: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    let URLString = "https://akabab.github.io/superhero-api/api/all.json"
    
    // initial load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // initial view
    private func setupView() {
        self.loading.isHidden = true
        self.heroText.text = ""
        self.heroImage.image = nil
    }
    
    // when button is pressed
    @IBAction func getRandomHero(_ sender: Any) {
        resetView()
        // check whether we did request
        if superheroes.isEmpty {
            // do requestu
            fetchSuperHeroes()
        } else {
            displayRandomHero()
        }
    }
    
    // fetch superhero
    private func fetchSuperHeroes() {
        loading.startAnimating()
        
        AF.request(self.URLString).responseDecodable(of: [SuperHero].self) { response in
            switch response.result {
            case .success(let heroes):
                self.superheroes = heroes
                self.displayRandomHero()
            case .failure(let error):
                print(error)
                let message = "Failed to load superheroes. Please check your connection."
                self.updateUIWithError(message: message)
            }
        }
    }
    
    
    private func fetchImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
    
    //
    private func displayRandomHero() {
        guard let randomHero = superheroes.randomElement() else {
            updateUIWithError(message: "No superheroes available.")
            return
        }
        updateView(with: randomHero)
    }
    
    private func updateView(with hero: SuperHero) {
        self.heroImage.kf.setImage(with: URL(string: hero.images.sm))
        self.heroText.text = """
        \(hero.name) has the following:
        Powerstats: intelligence \(hero.powerstats.intelligence), strength \(hero.powerstats.strength), and speed \(hero.powerstats.speed).
        Appearance: a gender of \(hero.appearance.gender?.lowercased() ?? "unknown"), a race of \(hero.appearance.race?.lowercased() ?? "unknown"), a height of \(hero.appearance.height[1].lowercased()), and a weight of \(hero.appearance.weight[1].lowercased()).
        Aliases: \(hero.biography.aliases.joined(separator: ", ")).
        """
        self.loading.stopAnimating()
        self.loading.isHidden = true
    }
    
    // when button is clicked and started to load view
    private func resetView() {
        heroText.text = ""
        heroImage.image = nil
        loading.isHidden = false
        loading.startAnimating()
    }
    
    private func updateUIWithError(message: String) {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.loading.isHidden = true
            self.heroText.text = message
            print("Error: \(message)")
        }
    }
}

