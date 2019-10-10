//
//  IssuesViewController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit
class IssuesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var issues:[Issue] = []
    var repository:Repository!
    
    
     override func viewDidLoad() {
            super.viewDidLoad()
        
        //Setup Repository Cell Nib
        let issueCellNib = UINib(nibName: "IssueCell", bundle: nil)
        tableView.register(issueCellNib, forCellReuseIdentifier: "IssueCell")
        
            
            //Load Repository Data
            loadIssues()
            
            
            
            
        }
        
        private func loadIssues(){
            ServiceManager.getIssues(repository.issues_url!) { (issues, error) in
                if(error != nil || issues == nil){
                    //TODO Add popup alert here
                    print("There was an error processing your request")
                } else{
                    self.issues = issues!
                }
                
                //Dispatch UI Updates on the Main Thread
                DispatchQueue.main.async {
                   self.tableView.delegate = self
                   self.tableView.dataSource = self
                   self.tableView.reloadData()
                   
                }
                
            }
            
        }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    }

extension IssuesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell") as! IssueCell
        let issueCell = cell
        let currentIssue = issues[indexPath.row]
        issueCell.issue = currentIssue
        issueCell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc:IssueDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "IssueDetailViewController") as! IssueDetailViewController
                   vc.issue = issues[indexPath.row]
                   self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
