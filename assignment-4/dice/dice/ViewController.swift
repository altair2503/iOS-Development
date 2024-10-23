import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Here is array of UIImages of dice
    let diceImages = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6")
    ]

    //Outlet of left dice
    @IBOutlet weak var leftDice: UIImageView!
    //Outlet of right dice
    @IBOutlet weak var rightDice: UIImageView!
    //Outlet to action button to start shake of dice
    @IBOutlet weak var isMatch: UILabel!
    @IBAction func rollDiceButton(_ sender: Any) {
        //make random of left and right dices
        let nextLeftDice = diceImages.randomElement()
        var nextRightDice = diceImages.randomElement()
        //if they are equal change right till they will be different
        if nextLeftDice == nextRightDice {
            self.isMatch.text = "It is match"
        }
        //as result different and random left and right
        leftDice.image = nextLeftDice ?? leftDice.image
        rightDice.image = nextRightDice ?? rightDice.image
        
    }
    //Bonus task
    //ovirride function if motionShake then we call our function
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDiceButton(UIButton())
        }
    }

}

