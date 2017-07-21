//
//  ServerRequest.swift
//  Adobe Campaign Client
//
//  Created by ManishP on 14/07/17.
//  Copyright © 2017 ManishP. All rights reserved.
//

import Foundation

class ServerRequest {

    
    static func loginRequest(login:String,pass:String, responceHandler: loginResponseHandler) {
        

        let url = URL(string: Constants.login_api_path)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
       let postString = "user=\(login)&pass=\(pass)&campaignServerName=\(Constants.campaignServerUrl)&deviceId=";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                DispatchQueue.main.async {
                    //Update your UI here
                
                if let token = responseJSON["token"] as? String {
                    Constants.sessionToken = token;
                    
                    responceHandler.moveToNext(response: true);
                    
                }
                else { responceHandler.moveToNext(response: false)}
                    
                }
                
                
            } else { responceHandler.moveToNext(response: false)}
        }
        
        task.resume()
    }

 
}
