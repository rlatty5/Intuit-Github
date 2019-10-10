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
   static var INTUIT_REPO = "https://api.github.com/users/intuit/repos"
    
    static func setup() {
       
        //singelton instance of repo list
        repositories = []
    }
    
    static func getRepositories(completion: @escaping (_ repositories:[Repository]?, _ error: Error?) -> Void){
        ServiceManager.getRequest(url: INTUIT_REPO) { (data, error) in
            repositories = [] //clear previos data
            if(data == nil || error != nil){
                completion([], error)
            } else{
                for repo in data!{
                    if let r = Repository(data: repo){
                        repositories.append(r)
                    }
                }
                completion(repositories, nil)
            }
            
            
        }
    }
    
    static func getIssues(_ issueURL: String, completion: @escaping (_ issues:[Issue]?, _ error: Error?) -> Void){
        ServiceManager.getRequest(url: issueURL) { (data, error) in
            var issueList:[Issue] = [] //clear previos data
            if(data == nil || error != nil){
                completion([], error)
            } else{
                for issue in data!{
                    if let i = Issue(data: issue){
                        issueList.append(i)
                    }
                }
                completion(issueList, nil)
            }
            
            
        }
    }
    
    static func getRequest(url: String, completion: @escaping (_ data:[[String: Any]]?, _ error: Error?) -> Void){
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //request.httpBody = try? JSONSerialization.data(withJSONObject: [], options: [])
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                print(response!)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! [[String: Any]]
                    print(json)
                    completion(json, nil)
                    
                } catch {
                    print("error")
                    completion(nil, error)
                }
            })

            task.resume()
        } else{
           //TODO Throw Custom Error Message
            completion(nil, NSError(domain:"", code:503, userInfo:nil))
            
        }
        
        
    }
    
    static func postRequest(completion: @escaping (_ error: Error?) -> Void){
        
    }
    
    
}
