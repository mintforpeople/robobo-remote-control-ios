//
//  CommandQueue.swift
//  robobo-remote-control
//
//  Created by Luis Felipe Llamas Luaces on 02/04/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import UIKit

class CommandQueue: NSObject {
    var commands: [Command] = []
    let commandLimit: Int = 1000
    
    override init() {
        super.init()
        
    }
    
    
    
    func put (_ command: Command){
        if (commands.count < commandLimit){
        commands.append(command)
        } else {
            print("❌ Command queue full")
        }
    }
    
    func take() throws -> Command{
        if isEmpty(){
            throw RemoteModuleError.commandQueueEmpty
        }else{
            let c : Command = commands.first!
            commands.remove(at: 0)
            return c
        }
        
    }
    
    func isEmpty() -> Bool{
        return commands.count == 0
        
    }
}


