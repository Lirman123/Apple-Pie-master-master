//
//  Game.swift
//  Apple Pie
//
//  Created by student on 12.04.2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

struct game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLatters: [Character]
    
    var formattedWord: String {
        get {
            var guessedWord = ""
            for letter in word {
                if guessedLatters.contains(letter) {
                    guessedWord += "\(letter)"
                } else {
                    guessedWord += "_" 
                }
            }
            
            return guessedWord
        }
    }
    
    mutating func playerGuessed(latter: Character) {
        guessedLatters.append(latter)
        
        if !word.contains(latter) {
            incorrectMovesRemaining -= 1
        }
    }
}
