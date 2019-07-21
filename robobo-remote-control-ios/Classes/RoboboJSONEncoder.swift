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
//  RoboboJSONEncoder.swift
//  Pods-robobo-remote-control-ios_Example
//
//  Created by Luis on 30/05/2019.
//

import UIKit

public class RoboboJSONEncoder: NSObject {
    public func encodeStatus(_ s:Status) -> String {
        let quotes: String =  "\""
        var output: String = "{ \"name\" : "
        
        output += quotes + s.getName() + quotes + ","
        
        output += quotes + "value" + quotes + ": {"
        
        for val in s.getValue(){
            
            output += quotes + val.key + quotes + ":"
            output += quotes + val.value + quotes + ","
        }
        
        output = String(output.dropLast())
        
        output += "}}"
        
        
        return output
    }
    
    public func decodeCommand(_ str: String) throws -> RemoteCommand{
        let decoder = JSONDecoder()
        
        let jsonData = str.data(using: .utf8)!
        let command = try decoder.decode(RemoteCommand.self, from: jsonData)
        
        return command
    }
}
