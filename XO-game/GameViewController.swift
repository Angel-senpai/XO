//
//  GameViewController.swift
//  XO-game
//
//  Created by Evgeny Kireev on 25/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    let gameBoard = Gameboard()
    var currentState: GameState! {
        didSet {
            currentState.begin()
        }
    }
    
    lazy var referee = Referee(gameboard: gameBoard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
//            self.gameboardView.placeMarkView(XView(), at: position)
            self.currentState.addMark(at: position)
            self.switchToNextState()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        currentState = PlayerInputState(player: .first, gameViewController: self, markViewPrototype: MarkView())
    }
    
    private func switchToNextState() {
        guard !currentState.isCompleted else { return }
        
        if let winner = referee.determineWinner() {
            let logAction = LogAction.Log(.gameFinished(winner: winner))
            currentState = FinishedState(player: winner, gameViewController: self)
        } else if !gameBoard.isNotDraw() {
            currentState = PlayerInputState(player: nil, gameViewController: self, markViewPrototype: nil)
        } else if let nextPlayer = currentState.currentPlayer?.next {
            currentState = PlayerInputState(player: nextPlayer, gameViewController: self, markViewPrototype: nextPlayer.markViewPrototype)
        }
    }
    
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        let logAction = LogAction.Log(.restartGame)
        gameBoard.clear()
        gameboardView.clear()
        currentState = PlayerInputState(player: .first, gameViewController: self, markViewPrototype: nil)
    }
}

