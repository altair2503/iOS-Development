import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // initial start
    private func setupView() {
        self.loading.isHidden = true
        self.heroText.text = ""
        self.heroImage.image = nil
    }
    
    // when button is clicked
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
        guard let url = URL(string: URLString) else {
            updateUIWithError(message: "Invalid URL")
            return
        }
        
        loading.startAnimating()
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
                self.updateUIWithError(message: "Failed to load superheroes. Please check your connection.")
                return
            }
            
            guard let data = data else {
                self.updateUIWithError(message: "No data received from the server.")
                return
            }
            
            self.decodeSuperHeroData(data: data)
        }
        task.resume()
    }
    
    private func decodeSuperHeroData(data: Data) {
        do {
            superheroes = try JSONDecoder().decode([SuperHero].self, from: data)
            DispatchQueue.main.async {
                self.displayRandomHero()
            }
        } catch {
            print("Decoding Error: \(error.localizedDescription)")
            updateUIWithError(message: "Failed to decode superhero data.")
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
        guard let imageURL = URL(string: hero.images.sm) else {
            updateUIWithError(message: "Invalid image URL for \(hero.name).")
            return
        }
        
        fetchImage(from: imageURL) { image in
            DispatchQueue.main.async {
                self.loading.stopAnimating()
                self.loading.isHidden = true
                
                if let image = image {
                    self.heroImage.image = image
                    self.heroText.text = """
                    \(hero.name) has the following:
                    Powerstats: intelligence \(hero.powerstats.intelligence), strength \(hero.powerstats.strength), and speed \(hero.powerstats.speed).
                    Appearance: a gender of \(hero.appearance.gender?.lowercased() ?? "unknown"), a race of \(hero.appearance.race?.lowercased() ?? "unknown"), a height of \(hero.appearance.height[safe: 1]?.lowercased() ?? "unknown"), and a weight of \(hero.appearance.weight[safe: 1]?.lowercased() ?? "unknown").
                    Aliases: \(hero.biography.aliases.joined(separator: ", ")).
                    """
                } else {
                    self.updateUIWithError(message: "Failed to load image for \(hero.name).")
                }
            }
        }
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

// MARK: - Extensions
extension Array {
    /// Safe subscript to prevent out-of-bounds access
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
