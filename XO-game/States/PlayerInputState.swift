//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class PlayerInputState: GameState {
    var isCompleted: Bool = false
    
    let player: Player!
    var currentPlayer: Player? { player }
    public var markViewPrototype: MarkView!
    
    weak var gameViewController: GameViewController?
    
    init(player: Player?, gameViewController: GameViewController, markViewPrototype: MarkView?) {
        self.player = player
        self.gameViewController = gameViewController
        self.markViewPrototype = markViewPrototype
    }
    
    
    func begin() {
        
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        case .none:
            break
        }
        
        gameViewController?.winnerLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) {
        
        let logAction = LogAction.Log(.playerInput(player: player, position: position))
        
        guard !isCompleted else { return }
        
//        isCompleted = false
        guard let gameViewController = gameViewController else { return }
        
        gameViewController.gameboardView.placeMarkView(self.markViewPrototype.copy(), at: position)
//        gameViewController.gameboardView.placeMarkView(markView, at: position)
        gameViewController.gameBoard.setPlayer(player!, at: position)
        
    }
}
