//
//  AppDelegate.swift
//  Adobe Campaign Client
//
//  Created by ManishP on 14/07/17.
//  Copyright © 2017 ManishP. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    var mainWindowController: MainWindowController?

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindowController = MainWindowController()
        mainWindowController!.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

