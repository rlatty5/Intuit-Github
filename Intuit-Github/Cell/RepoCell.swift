//
//  RepoCell.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var watcherImageView: UIImageView!
    @IBOutlet weak var watcherCountLabel: UILabel!
    
    var repository:Repository!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(){
        //This cannot be null
        let user:User = repository.owner!
        self.profileImageView.downloadFrom(link: user.avatar_url!) {
            self.nameLabel.text = user.login
            self.languageLabel.text = self.repository.language
            self.titleLabel.text = self.repository.name
            self.descriptionLabel.text = self.repository.descriptionText
            self.forkCountLabel.text = String(self.repository.forks_count!)
            self.starLabel.text = String(self.repository.stargazers_count!)
            self.watcherCountLabel.text = String(self.repository.watchers_count!)
        }
    }
}
