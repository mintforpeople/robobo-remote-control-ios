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
        let st: Status = Status("ASD")
        remote.postStatus(st)
    }
}
