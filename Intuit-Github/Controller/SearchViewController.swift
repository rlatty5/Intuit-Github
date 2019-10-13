//
//  SearchViewController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/13/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit
class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var isSearching:Bool = false
    
    var filteredRepositoryList: [Repository] = []
    var repositoryList: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Setup Repository Cell Nib
        let repositoryCellNib = UINib(nibName: "RepoCell", bundle: nil)
        tableView.register(repositoryCellNib, forCellReuseIdentifier: "RepoCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        
    }
    
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRepositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
        let repoCell = cell
        let currentRepository = filteredRepositoryList[indexPath.row]
        repoCell.repository = currentRepository
        repoCell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:RepoDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "RepoDetailViewController") as! RepoDetailViewController
        vc.repository = filteredRepositoryList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension SearchViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //isSearching = false;
        
        print("searchBarTextDidEndEditing")
        
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false;
        DispatchQueue.main.async {
           self.tableView.reloadData()
           
        }
        print("searchBarCancelButtonClicked")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text != nil && searchBar.text!.isEmpty == false {
            isSearching = true;
        } else{
            isSearching = false;
            
        }
        DispatchQueue.main.async {
           self.tableView.reloadData()
           
        }
        print("searchBarSearchButtonClicked")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange")
        if searchText.isEmpty == false {
            filteredRepositoryList = repositoryList.filter({ $0.name!.contains(searchText) ||
                $0.descriptionText!.contains(searchText)})
            isSearching = true;
        } else{
            isSearching = false;
            
        }
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
           
        }
    }
    
}
