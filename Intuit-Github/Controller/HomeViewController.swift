//
//  HomeViewController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var repositoryList: [Repository] = []
    
    var isSearching:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load Repository Data
        loadRepositories()
        
        //Setup Repository Cell Nib
        let repositoryCellNib = UINib(nibName: "RepoCell", bundle: nil)
        tableView.register(repositoryCellNib, forCellReuseIdentifier: "RepoCell")
        
        //Setup Repository Cell Nib
        let searchBarCellNib = UINib(nibName: "SearchBarCell", bundle: nil)
        tableView.register(searchBarCellNib, forCellReuseIdentifier: "SearchBarCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    private func loadRepositories(){
        ServiceManager.getRepositories { (repositories, error) in
            if(error != nil || repositories == nil){
                //TODO Add popup alert here
                print("There was an error processing your request")
            } else{
                self.repositoryList = repositories!
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarCell") as! SearchBarCell
            cell.delegate = self
            return cell
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
            let repoCell = cell as! RepoCell
            let currentRepository = repositoryList[indexPath.row - 1]
            conversationCell.conversation = currentConversation
            conversationCell.configureCell()
            
            return cell
        }
    }
    

}

extension HomeViewController: UISearchBarDelegate{
    
   func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false;
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
}
