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
    
    @IBOutlet weak var tableView: UITableView!
    
    var repositoryList: [Repository] = []
    
    var isSearching:Bool = false
    
    var selectedRepository: Repository?
    
    
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
        
        
        
    }
    
    private func loadRepositories(){
        ServiceManager.getRepositories { (repositories, error) in
            if(error != nil || repositories == nil){
                //TODO Add popup alert here
                print("There was an error processing your request")
            } else{
                self.repositoryList = repositories!
            }
            
            //Dispatch UI Updates on the Main Thread
            DispatchQueue.main.async {
               self.tableView.delegate = self
               self.tableView.dataSource = self
               self.tableView.reloadData()
               
            }
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let repoNavigationController = segue.destination as! UINavigationController

        let repoDetailViewController = repoNavigationController.viewControllers.first as! RepoDetailViewController

        repoDetailViewController.repository = self.selectedRepository
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
            let repoCell = cell 
            let currentRepository = repositoryList[indexPath.row - 1]
            repoCell.repository = currentRepository
            repoCell.configureCell()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row > 0){
            let vc:RepoDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "RepoDetailViewController") as! RepoDetailViewController
            self.selectedRepository = repositoryList[indexPath.row - 1]
            vc.repository = self.selectedRepository
            self.navigationController?.pushViewController(vc, animated: true)
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
