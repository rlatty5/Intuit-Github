//
//  Issue.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
class Issue: NSObject {
    
    var id: Int?
    var title: String?
    var user: User?
    var state: String?
    var created_at: String?
    var updated_at: String?
    var assignees: [User]?
    var body: String?
    
    init?(data: [String: Any]) {
        if let id = data["id"] as? Int {
            self.id = id
        } else{
            return nil
        }
        
        if let title = data["title"] as? String {
            self.title = title
        }
        
        if let user = data["user"] as? [String:Any] {
            self.user = User(data: user)
        }
        
        if let state = data["state"] as? String {
            self.state = state
        }
        
        if let created_at = data["created_at"] as? String {
            self.created_at = created_at
        }
        
        if let updated_at = data["updated_at"] as? String {
            self.updated_at = updated_at
        }
        
        if let body = data["body"] as? String{
            self.body = body
        }
        
        
        if let assignees = data["assignees"] as? [Any] {
            self.assignees = []
            for assignee in assignees {
                if let a = assignee as? [String:Any]{
                    if let u = User(data: a){
                        self.assignees?.append(u)
                    }
                    
                }
                
            }
           
        }
        
    }
    
}
