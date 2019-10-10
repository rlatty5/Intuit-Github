//
//  ServiceManager.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class ServiceManager{
    
   static let appDelegate = UIApplication.shared.delegate as! AppDelegate
   static var repositories:[Repository]!
    
    static func setup() {
       
        repositories = []
    }
    
    static func getRequest(completion: @escaping (_ error: Error?) -> Void){
        var request = URLRequest(url: URL(string: "http://localhost:8080/api/1/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })

        task.resume()
        
    }
    
    static func postRequest(completion: @escaping (_ error: Error?) -> Void){
        
    }
    
    
}
