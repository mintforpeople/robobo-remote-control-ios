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
//  IRemoteControlModule.swift
//  robobo-remote-control
//
//  Created by Luis Felipe Llamas Luaces on 27/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol IRemoteControlModule: IModule {
    var processQueue:DispatchQueue! { get }
    
    func registerCommand(_ commandName:String, _ module: ICommandExecutor)
    
    func postStatus(_ status:Status)
    
    func postResponse(_ response: Response)
    
    func setPassword(_ password: String)
    
    func getPassword() -> String
    
    func registerRemoteControlProxy(_ proxy: IRemoteControlProxy)
    
    func unregisterRemoteControlProxy(_ proxy: IRemoteControlProxy)
    
    func queueCommand(_ command: RemoteCommand)
    
    func notifyConnection(_ connNumber: Int)
    
    func notifyDisconnection(_ connNumber: Int)
    
    

}
