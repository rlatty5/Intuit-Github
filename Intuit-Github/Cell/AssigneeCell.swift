//
//  AssigneeCell.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/10/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class AssigneeCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var user: User!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell()
        
    }
    
    func configureCell(){
        self.profileImageView.downloadFrom(link: user.avatar_url!) {
        //TODO
        }
    }
}
