//
//  ViewController.swift
//  RSPGame
//
//  Created by Da Hae Lee on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {

    // label
    @IBOutlet weak var statusOfGameLabel: UILabel!
    @IBOutlet weak var appSignLabel: UILabel!
    // button
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(state: .start)
    }
    
    @IBAction func choiceRock(_ sender: Any) {
        let myChoice:Sign = .rock
        play(myChoice: myChoice)
    }
    
    @IBAction func choiceScissors(_ sender: Any) {
        let myChoice:Sign = .scissors
        play(myChoice: myChoice)
    }
    
    @IBAction func choicePaper(_ sender: Any) {
        let myChoice:Sign = .paper
        play(myChoice: myChoice)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(state: .start)
    }
    
    func updateUI(state: GameState) {
        if state == .start {
            appSignLabel.text = "🤖"
            statusOfGameLabel.text = state.description
            playAgainButton.isHidden = true
            view.backgroundColor = UIColor.white

            rockButton.isEnabled = true
            rockButton.isHidden = false
            scissorsButton.isEnabled = true
            scissorsButton.isHidden = false
            paperButton.isEnabled = true
            paperButton.isHidden = false
            
        } else if state == .win {
            statusOfGameLabel.text = state.description
            view.backgroundColor = UIColor.green
        } else if state == .draw {
            statusOfGameLabel.text = state.description
            view.backgroundColor = UIColor.cyan
        } else if state == .lose {
            statusOfGameLabel.text = state.description
            view.backgroundColor = UIColor.lightGray
        }
    }
    
    func play(myChoice: Sign) {
        let robotChoice:Sign = randomSign()
        let playResult = myChoice.match(opponent: robotChoice)
        appSignLabel.text = robotChoice.emoji
        
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        
        updateUI(state: playResult)
        
        if myChoice.emoji == "✊" {
            scissorsButton.isHidden = true
            paperButton.isHidden = true
        } else if myChoice.emoji == "✌️" {
            rockButton.isHidden = true
            paperButton.isHidden = true
        } else {
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
    }
}
