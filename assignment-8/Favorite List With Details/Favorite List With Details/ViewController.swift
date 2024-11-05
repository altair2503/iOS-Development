import UIKit

class ViewController: UIViewController {
    
    private var favoriteGames: [Game] = [
        Game(cover: UIImage.theLastOfUs, title: "The Last of Us Remastered", platform: "PS4", release: "2014"),
        Game(cover: UIImage.bloodbornePng,title: "Bloodborne", platform: "PS4", release: "2015"),
        Game(cover: UIImage.spiderMan,title: "Marvel's Spider-Man", platform: "PS4", release: "2018"),
        Game(cover: UIImage.godOfWar ,title: "God of War", platform: "PS4", release: "2018"),
        Game(cover: UIImage.horizon, title: "Horizon Zero Dawn", platform: "PS4", release: "2017"),
        Game(cover: UIImage.starWars,title: "Star Wars Battlefront", platform: "PS4, XBOX ONE, Windows", release: "2015"),
        Game(cover: UIImage.infamous,title: "Infamous Second Son", platform: "PS4", release: "2014"),
        Game(cover: UIImage.beyondTwoSouls,title: "Beyond: Two Souls", platform: "PS3, PS4", release: "2013"),
        Game(cover: UIImage.battlefield, title: "Battlefield Hardline", platform: "PS4, XBOX ONE, Windows", release: "2015"),
        Game(cover: UIImage.detroir,title: "Detroit: Become Human", platform: "PS4", release: "2018")
    ]

    @IBOutlet weak var gameTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameTable.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteGameCell", for: indexPath)
            cell.textLabel?.text = gameTable[indexPath.row].name
            return cell
    }
}
