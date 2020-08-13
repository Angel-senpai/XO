//
//  LogCommand.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        
        switch self.action {
        case .playerInput(let player, let position):
            return "\(player) placed mark at \(position)"
        case .gameFinished(let winner):
            if let winner = winner {
                return "\(winner) won the game"
            } else {
                return "There is no winner"
            }
        case .restartGame:
            return "Game was restarted"
        }
        
    }
    
}
