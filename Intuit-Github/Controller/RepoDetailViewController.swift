//
//  RepoDetailViewController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit
class RepoDetailViewController: UIViewController {
    
    @IBOutlet weak var profileViewController: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var privateLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var branchLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var issuesButton: UIButton!
    
    var repository:Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func viewIssues(_ sender: Any) {
        
    }
    
}
