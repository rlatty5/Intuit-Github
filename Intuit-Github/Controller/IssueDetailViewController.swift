//
//  IssueDetailViewController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/10/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var assigneesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    var issue:Issue!
    var assignees:[User] = []
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
            //Setup Repository Cell Nib
            let assigneeCellNib = UINib(nibName: "AssigneeCell", bundle: nil)
            tableView.register(assigneeCellNib, forCellReuseIdentifier: "AssigneeCell")
           
            configureView()
           //Load Repository Data
           loadAssigness()
        
           
           
           
       }
    
    private func loadAssigness(){
        if(issue.assignees != nil){
            assignees = []
        }
        assignees = issue.assignees!
        //Dispatch UI Updates on the Main Thread
        DispatchQueue.main.async {
           self.tableView.delegate = self
           self.tableView.dataSource = self
           self.tableView.reloadData()
           
        }
        
    }
    
    private func configureView(){
        let user:User = issue.user!
        self.profileImageView.downloadFrom(link: user.avatar_url!) {
            self.nameLabel.text = user.login
            self.titleLabel.text = self.issue.title
            self.stateLabel.text = self.issue.state
            self.bodyLabel.text = self.issue.body
            self.createdAtLabel.text = self.issue.created_at?.UTCToLocalAndYear()
            self.updatedLabel.text = self.issue.updated_at?.UTCToLocalAndYear()
            self.profileImageView.layer.masksToBounds = false
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.height/2
            self.profileImageView.clipsToBounds = true
            
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension IssueDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(assignees.count == 0){
            self.tableView.isHidden = true
            self.assigneesLabel.isHidden = true
        } else{
            self.tableView.isHidden = false
            self.assigneesLabel.isHidden = false
        }
        return assignees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssigneeCell") as! AssigneeCell
        let assigneeCell = cell
        let currentAssignee = assignees[indexPath.row]
        assigneeCell.user = currentAssignee
        assigneeCell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
        
    }
    

}
