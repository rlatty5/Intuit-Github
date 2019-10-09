//
//  User.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
class User: NSObject {
    
   var id:Int?
   var login:String?
   var avatar_url:String?
   var type:String?
    
    
    init?(data: [String: Any]) {
        if let id = data["id"] as? Int {
            self.id = id
        } else{
            return nil
        }
        
        if let login = data["login"] as? String {
            self.login = login
        } else{
            return nil
        }
        
        if let avatar_url = data["avatar_url"] as? String {
            self.avatar_url = avatar_url
        } else{
            return nil
        }
        
        if let type = data["type"] as? String {
            self.type = type
        } else{
            return nil
        }
    }
    
    override var description : String {
        return "Userid: \(String(describing: id))" +
            " login: \(String(describing: login))" +
            " avatar_url: \(String(describing: avatar_url))" +
        " type: \(String(describing: type))"
    }
}
