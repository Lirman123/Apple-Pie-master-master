//
//  ViewController.swift
//  Apple Pie
//
//  Created by student on 29.03.2018.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(latter: letter)
        updateUI()
    }
    
    var listOfWords = [
        "Анастасия",
        "Анна",
        "Мария"
    ]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    var currentGame: game!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        
        currentGame = game(word: newWord.lowercased(), incorrectMovesRemaining: incorrectMovesAllowed, guessedLatters: [])
        updateUI()
        
    }
    
    func updateUI() {
        let filename = "Tree \(currentGame.incorrectMovesRemaining)"
        treeImageView.image = UIImage(named: filename)
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Выйгрыши: \(totalWins), Проигрыши: \(totalLosses)"
    }
}



