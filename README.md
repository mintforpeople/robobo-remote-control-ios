# robobo-remote-control-ios

The Robobo Remote Control module is the core of the reomote communications system of the Robobo platform. This module acts as a relay for the messages received (encoded in JSON), decodes them and sends them to the module that registered that command. It also encodes the different status provided by the sensing modules of the robot and sends them encoded in JSON through a module implementing the ```IRemoteControlProxy``` protocol, this is because the remote control module is technology-agnostic, and the actual connection with the external clients is provided by the remote proxy's. 



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

In this example is demonstrated how the remote control module is instanced and the inplementation of a very simple RemoteProxy and StatusSender.

In  ```ViewController.swift``` we can see the instantiation of the remote module and how to register a remote proxy in it. In this case the remote proxy is a simple swift class, but it could also be a Robobo Module implementing the remote proxy protocol.


```swift
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
```

It also registers the command "TEST" and defines a class that implements ICommandExecutor, used to execute the different commands that arrive through the module:

```swift
class Exec: NSObject, ICommandExecutor {
    func executeCommand(_ c: RemoteCommand, _ rcmodule: IRemoteControlModule) {
        print(c)
    }
}
```

The app only has a button sends a Status and a Command via the remote module:

```swift
@IBAction func Ontouch(_ sender: UIButton) {
    manager.log("TOUCHY")
    var c: RemoteCommand = RemoteCommand("TEST",0,[:])
    manager.log("COMMAND")
    
    do{

        remote.queueCommand(try RoboboJSONEncoder().decodeCommand( "{\"name\":\"MOVE\",\"parameters\":{},\"id\":\(1)}"))

    }catch{
        print (error)
    }
    manager.log("STATUS")

    stSender.sendStatus()
}
```

The StatusSender class has an example of sending a Status message

```swift
public class StatusSender: NSObject {
    var remote:IRemoteControlModule
    
    init(_ rem:IRemoteControlModule) {
        remote = rem
    }

    public func sendStatus(){
    let st: Status = Status("TestStatus")
        st.putContents("number", "100")
        st.putContents("text", "LoremIpsum")
        remote.postStatus(st)
    }
}
```


## Requirements

This module depends on robobo-framework-ios-pod, add it to your podfile as follows:

```ruby
pod 'robobo-framework-ios-pod','~>0.1.0'
```

## Installation

robobo-remote-control-ios is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'robobo-remote-control-ios'
```

Also add the following lines to the beginning of `your Podfile, to allow the download of dependencies through our private Podspec repository:

```ruby
source "https://github.com/mintforpeople/mint-podspec-repo.git"
source "https://github.com/CocoaPods/Specs.git"
```

When importing it in your code, be aware that the dashes on the module name are converted to underscores:

```swift
import robobo_remote_control_ios
```

## Author

luis.llamas@mintforpeople.com

## License

robobo-remote-control-ios is available under the Apache 2.0 license. See the LICENSE file for more info.

***
<!-- 
    ROSIN acknowledgement from the ROSIN press kit
    @ https://github.com/rosin-project/press_kit
-->

<a href="http://rosin-project.eu">
  <img src="http://rosin-project.eu/wp-content/uploads/rosin_ack_logo_wide.png" 
       alt="rosin_logo" height="60" >
</a>

Supported by ROSIN - ROS-Industrial Quality-Assured Robot Software Components.  
More information: <a href="http://rosin-project.eu">rosin-project.eu</a>

<img src="http://rosin-project.eu/wp-content/uploads/rosin_eu_flag.jpg" 
     alt="eu_flag" height="45" align="left" >  

This project has received funding from the European Union’s Horizon 2020  
research and innovation programme under grant agreement no. 732287. 

