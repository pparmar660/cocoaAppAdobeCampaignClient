//
//  MainWindowController.swift
//  Adobe Campaign Client
//
//  Created by ManishP on 19/07/17.
//  Copyright © 2017 ManishP. All rights reserved.
//

import Cocoa

 protocol loginResponseHandler {
    func moveToNext(response: Bool)
}

class MainWindowController: NSWindowController, loginResponseHandler {
    
    
  
    override var windowNibName: String? { return "MainWindowController" }
    override var owner: AnyObject { return self }
    
    
    @IBOutlet weak var userName: NSTextField!
    @IBOutlet weak var password: NSSecureTextField!
    
    
    
    @IBAction func login(_ sender: Any) {
        
        
        ServerRequest.loginRequest(login: userName.stringValue, pass: password.stringValue, responceHandler : self);

    }
   
    
     func moveToNext(response : Bool) {
        
        if(response){
            
            let newViewController = HomeViewController()
            self.contentViewController = newViewController;
             
        }
    }
    
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
