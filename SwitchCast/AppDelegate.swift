//
//  AppDelegate.swift
//  SwitchCast
//
//  Created by 1024jp on 2017/03/02.
//  © 2017 1024jp
//

import Cocoa

protocol Mascot: class {
    
    func sayHello(_ sender: Any?)
}


class Gayan: NSResponder, Mascot {
    
    func sayHello(_ sender: Any?) {
        
        print("Hello!")
    }
    
}


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let gayan = Gayan()
        NSApp.nextResponder = gayan
        
        guard let receiver = NSApp.target(forAction: #selector(Gayan.sayHello(_:))) else { return }
        
        switch receiver {
        case is Mascot: break  // <- crash on this line
        default: break
        }
        
        switch receiver as AnyObject {
        case is Mascot: break  // <- while this line doesn't crash
        default: break
        }
        
    }
    
}
