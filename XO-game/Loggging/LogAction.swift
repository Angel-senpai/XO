//
//  LogAction.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

public enum LogAction {
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
    
    public func Log(_ action: LogAction) {
        let command = LogCommand(action: action)
        LoggerInvoker.shared.addLogCommand(command)
    }
}
