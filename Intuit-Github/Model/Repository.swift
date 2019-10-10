//
//  Repository.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
class Repository: NSObject {
    
    var id: Int?
    var name: String?
    var isPrivate: Bool?
    var owner: User?
    var descriptionText: String?
    var created_at: String?
    var updated_at: String?
    var stargazers_count: Int?
    var watchers_count: Int?
    var forks_count: Int?
    var default_branch: String?
    var issues_url: String?
    var issues: [Issue]?
    var language: String?
    
    init?(data: [String: Any]) {
        if let id = data["id"] as? Int{
            self.id = id
        } else{
            return nil
        }
        
        if let name = data["name"] as? String{
            self.name = name
        }
        
        if let isPrivate = data["private"] as? Bool{
            self.isPrivate = isPrivate
        } else{
            self.isPrivate = false
        }
        
        if let owner = data["owner"] as? [String:Any] {
            self.owner = User(data: owner)
            if self.owner == nil {
                return nil
            }
        } else{
            return nil
        }
        
        if let descriptionText = data["description"] as? String{
            self.descriptionText = descriptionText
        }
        
        if let created_at = data["created_at"] as? String{
            self.created_at = created_at
        }
        
        if let updated_at = data["updated_at"] as? String{
            self.updated_at = updated_at
        }
        
        if let stargazers_count = data["stargazers_count"] as? Int{
            self.stargazers_count = stargazers_count
        } else{
            self.stargazers_count = 0
        }
        
        if let watchers_count = data["watchers_count"] as? Int{
            self.watchers_count = watchers_count
        } else{
            self.watchers_count = 0
        }
        
        if let forks_count = data["forks_count"] as? Int{
            self.forks_count = forks_count
        } else{
            self.forks_count = 0
        }
        
        if let default_branch = data["default_branch"] as? String{
            self.default_branch = default_branch
        }
        
        if let issues_url = data["issues_url"] as? String{
            self.issues_url = issues_url
        }
        
        if let language = data["language"] as? String{
            self.language = language
        }
        
    }
    
    
    
}
