//
//  File.swift
//  BullsEye
//
//  Created by pavithran.mm on 07/09/22.
//

import Foundation

struct GameController{
    
    private var game : BullsEyeGame
    
    enum LabelValues {
        case target, score, round, slider
    }
    
    init(){
        self.game = BullsEyeGame()
    }
    
    mutating func updateSliderValue(sliderValue: Int){
        game.currentValue = sliderValue
    }
    
    mutating func startNewGame(){
        game.round = 0
        game.score = 0
        startNewRound()
    }
    
    mutating func startNewRound(){
        game.round += 1
        game.currentValue = 50
        game.targetValue = Int.random(in: 1...100)
    }
    
    mutating func updateScore() -> (title: String, message: String ){
        let difference = abs(game.targetValue - game.currentValue)
        let message = "You have scored: "
        var points : Int = (100 - difference)
        
        
        switch(difference){
        case 0:
            points += 100
            game.score += points
            return ("Perfect!" , message + String(points))
        case 1:
            points += 50
            game.score += points
            return ("Aaah!! Missed that!", message + String(points))
        case 2...5:
            points += 25
            game.score += points
            return ("Almost There", message + String(points))
        case 6...10:
            game.score += points
            return ("Out of the way", message + String(points))
        default:
            game.score += points
            return("Needs more precision", message + String(points))
        }
    }
    
    func getLabelValues() -> [LabelValues : Int]{
        return [.target : game.targetValue,
                .score : game.score,
                .round : game.round,
                .slider : game.currentValue
        ]
    }
}
