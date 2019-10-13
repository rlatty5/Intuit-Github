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
        
       // profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        
    }
    
    func configureCell(){
           //This cannot be null
        let user:User = issue.user!
           self.profileImageView.downloadFrom(link: user.avatar_url!) {
            self.createdLabel.text = "Opened by " + "\(user.login ?? "none") on " + (self.issue.created_at?.UTCToLocal())!
            self.titleLabel.text = self.issue.title
                //self.UTCToLocal(date: self.issue.created_at!)
            //Opened by rlatty5 on Apr 30
           }
       }

}
