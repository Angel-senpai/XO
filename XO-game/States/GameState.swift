//
//  GameState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

protocol GameState {
    func begin()
    func addMark(at position: GameboardPosition)
    
    var isCompleted: Bool { get }
    var currentPlayer: Player? { get }
}
