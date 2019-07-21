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
//  Value.swift
//  robobo-remote-control
//
//  Created by Luis Felipe Llamas Luaces on 27/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import UIKit

public class Value: NSObject {
    var value:[String:String]
    
    public override init() {
        value = [String:String]()
        value[""]=""
    }
    
    public func putContents(_ key:String, _ val:String){
        value[key] = val
    }
    
    public func getValue() -> [String:String]{
        return value
    }
}
