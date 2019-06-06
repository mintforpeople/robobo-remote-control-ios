//
//  ViewController.swift
//  robobo-remote-control-ios
//
//  Created by 623e45d3ebd5e88abf84e2a4f33c4511abb531ad on 05/23/2019.
//  Copyright (c) 2019 623e45d3ebd5e88abf84e2a4f33c4511abb531ad. All rights reserved.
//

import UIKit
import robobo_remote_control_ios
import robobo_framework_ios_pod

class ViewController: UIViewController, RoboboManagerDelegate {
    @IBOutlet var sfdhdfns: UIButton!
    
    var manager : RoboboManager!
    var remote :IRemoteControlModule!
    var stSender: StatusSender!
    var proxy : ProxyTest!
    override func viewDidLoad() {
        super.viewDidLoad()
        proxy = ProxyTest()
        
        manager = RoboboManager()
        manager.addFrameworkDelegate(self)
        do{
            try manager.startup()
            
            let module = try manager.getModuleInstance("IRemoteControlModule")
            remote = module as? IRemoteControlModule
            stSender = StatusSender(remote)

        }catch{
            print(error)
        }
        remote.registerRemoteControlProxy(proxy)
        
        remote.registerCommand("TEST", Exec())

        
        
    }
    
    @IBAction func Ontouch(_ sender: UIButton) {
        manager.log("TOUCHY")
        var c: Command = Command("TEST",0,[:])
        manager.log("COMMAND")
        do{
        remote.queueCommand(try RoboboJSONEncoder().decodeCommand( "ADASASASA"))//{\"name\":\"MOVE\",\"parameters\":{},\"id\":2}"))
        }catch{
            print (error)
        }
        manager.log("STATUS")

        stSender.sendStatus()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadingModule(_ moduleInfo: String, _ moduleVersion: String) {
        self.manager.log("Loading \(moduleInfo) \(moduleVersion)",LogLevel.VERBOSE)
        
    }
    
    func moduleLoaded(_ moduleInfo: String, _ moduleVersion: String) {
        self.manager.log("Loaded \(moduleInfo) \(moduleVersion)", LogLevel.INFO)
    }
    
    func frameworkStateChanged(_ state: RoboboManagerState) {
        self.manager.log("Framework state changed: \(state)")
    }
    
    func frameworkError(_ error: Error) {
        self.manager.log("Framework error: \(error)", LogLevel.WARNING)
    }
}

class Exec: NSObject, ICommandExecutor {
    func executeCommand(_ c: Command, _ rcmodule: IRemoteControlModule) {
        print(c)
    }
    
    
}
