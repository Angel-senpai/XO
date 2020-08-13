//
//  LoggerInvoker.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 8/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class LoggerInvoker {
    
    public static var shared = LoggerInvoker()
    private let batchSize = 3
    private let logger = Logger()
    private var commands: [LogCommand] = []
    
    private init() {
        
    }
    
    func addLogCommand(_ command: LogCommand) {
        self.commands.append(command)
        self.executeCommands()
    }
    
    func executeCommands() {
        guard self.commands.count >= batchSize else {
            return
        }
        
        self.commands.forEach { self.logger.writeMessage($0.logMessage) }
        self.commands = []
        
    }
}
