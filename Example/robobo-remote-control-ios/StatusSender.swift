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
//  StatusSender.swift
//  robobo-remote-control-ios_Example
//
//  Created by Luis on 24/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import robobo_remote_control_ios
public class StatusSender: NSObject {
    var remote:IRemoteControlModule
    init(_ rem:IRemoteControlModule) {
            remote = rem
    }
    
    public func sendStatus(){
        let st: Status = Status("Ah SD")
        //st.putContents("ori", "100")
        //st.putContents("orsdsi", "100")
        remote.postStatus(st)
    }
}
