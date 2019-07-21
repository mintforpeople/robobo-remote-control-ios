/*******************************************************************************
 *
 *   Copyright 2019, Manufactura de Ingenios Tecnológicos S.L. 
 *   <http://www.mintforpeople.com>
 *
 *   Redistribution, modification and use of this software are permitted under
 *   terms of the Apache 2.0 License.
 *
 *   This software is distributed in the hope that it will be useful,
 *   but WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND; without even the implied
 *   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   Apache 2.0 License for more details.
 *
 *   You should have received a copy of the Apache 2.0 License along with    
 *   this software. If not, see <http://www.apache.org/licenses/>.
 *
 ******************************************************************************/
 
 //
//  CommandQueue.swift
//  robobo-remote-control
//
//  Created by Luis Felipe Llamas Luaces on 02/04/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import UIKit

class CommandQueue: NSObject {
    var commands: [RemoteCommand] = []
    let commandLimit: Int = 100
    
    override init() {
        super.init()
        
    }
    
    
    
    func put (_ command: RemoteCommand){
        if (commands.count < commandLimit){
        commands.append(command)
        } else {
            print("❌ Command queue full")
        }
    }
    
    func take() throws -> RemoteCommand{
        if isEmpty(){
            throw RemoteModuleError.commandQueueEmpty
        }else{
            let c : RemoteCommand = commands.first!
            commands.remove(at: 0)
            return c
        }
        
    }
    
    func isEmpty() -> Bool{
        return commands.count == 0
        
    }
}


