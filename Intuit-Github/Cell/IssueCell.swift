//
//  IssueCell.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class IssueCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var createdLabel: UILabel!
    var issue:Issue!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(){
           //This cannot be null
        let user:User = issue.user!
           self.profileImageView.downloadFrom(link: user.avatar_url!) {
            self.createdLabel.text = "Opened by " + "\(user.login ?? "none") on " + self.UTCToLocal(date: self.issue.created_at!)
            //Opened by rlatty5 on Apr 30
           }
       }
    
    func UTCToLocal(date:String) -> String {
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let localDate = formatter.date(from: date)
        
        let m = calendar.component(.month, from: localDate!)
        let month = DateFormatter().monthSymbols[m - 1]
        let day = calendar.component(.day, from: localDate!)
        print(month + " " + String(day))
        return month + " " + String(day)
       
    }

}
