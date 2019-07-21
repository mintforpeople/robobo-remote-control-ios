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
//  Command.swift
//  robobo-remote-control
//
//  Created by Luis Felipe Llamas Luaces on 27/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import UIKit

public class RemoteCommand: NSObject, Codable {
    private var name: String
    private let id: Int
    private var parameters: [String:String]
    
    public init(_ name:String, _ id:Int, _ parameters: [String: String]) {
        self.name = name
        self.id = id
        self.parameters = parameters
    }
    
    public func getName() -> String{
        return name
    }
    
    public func getId() -> Int{
        return id
    }
    
    public func getParameters() -> [String:String]{
        return parameters
    }
}
