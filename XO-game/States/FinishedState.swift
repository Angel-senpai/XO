//
//  FinishedState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class FinishedState: GameState {
    var isCompleted: Bool = false
    var currentPlayer: Player?
    
    weak var gameViewController: GameViewController?
    
    init(player: Player, gameViewController: GameViewController) {
        self.currentPlayer = player
        self.gameViewController = gameViewController
    }
    
    
    func begin() {
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true
        gameViewController?.winnerLabel.isHidden = false
        
        let winnerText: String
        
        switch currentPlayer {
        case .first:
            winnerText = "First Player Won"
        case .second:
            winnerText = "Second Player Won"
        default:
            winnerText = "Draw"
        }
        
        gameViewController?.winnerLabel.text = winnerText
        
    }
    
    func addMark(at position: GameboardPosition) {}
}
