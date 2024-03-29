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
    
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var watchCountLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    
    var repository:Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup View
        configureView()
    }
    
    func configureView(){
        backgroundView.layer.cornerRadius = 10
        issuesButton.layer.cornerRadius = 10
        
        let user:User = repository.owner!
        self.profileViewController.downloadFrom(link: user.avatar_url!) {
            self.nameLabel.text = user.login
            self.languageLabel.text = self.repository.language
            self.titleLabel.text = self.repository.name
            self.descriptionLabel.text = self.repository.descriptionText
            self.forkCountLabel.text = String(self.repository.forks_count!)
            self.starCountLabel.text = String(self.repository.stargazers_count!)
            self.watchCountLabel.text = String(self.repository.watchers_count!)
            
            if self.repository.isPrivate != nil {
                self.privateLabel.text = "Private"
            } else{
                self.privateLabel.text = "Public"
            }
            
            self.createdLabel.text = self.repository.created_at?.UTCToLocalAndYear()
            self.updatedLabel.text = self.repository.updated_at?.UTCToLocalAndYear()
            self.branchLabel.text = self.repository.default_branch
            
            if(self.repository.open_issues_count == 0){
                self.issuesButton.isHidden = true
            } else{
                self.issuesButton.isHidden = false
            }
            
            self.profileViewController.layer.masksToBounds = false
            self.profileViewController.layer.cornerRadius = self.profileViewController.frame.height/2
            self.profileViewController.clipsToBounds = true
        }
    }
    
    static func formatDate(){
        
    }
    
    @IBAction func viewIssues(_ sender: Any) {
        
        let vc:IssuesViewController = self.storyboard!.instantiateViewController(withIdentifier: "IssuesViewController") as! IssuesViewController
        vc.repository = self.repository
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
