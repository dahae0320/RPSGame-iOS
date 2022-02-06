//
//  Sign.swift
//  RSPGame
//
//  Created by Da Hae Lee on 2022/02/03.
//

import Foundation
import UIKit
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum GameState {
    case start, win, lose, draw
    
    var description:String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You won!"
        case .lose:
            return "You Lose..."
        case .draw:
            return "Draw."
        }
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji:String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
    
    func match(opponent: Sign) -> GameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch opponent {
            case .rock:
                return .win
            case .paper:
                return .draw
            case .scissors:
                return .lose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return .lose
            case .paper:
                return .win
            case .scissors:
                return .draw
            }
        }
    }
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

//let myChoice:Sign = .scissors
//let appChoice:Sign = randomSign()
//
//myChoice.match(opponent: appChoice)
