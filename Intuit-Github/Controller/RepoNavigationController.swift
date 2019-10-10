//
//  RepoNavigationController.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/10/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit
class RepoNavigationController: UINavigationController {
    
    var selectedRepository: Repository?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repoDetailViewController = self.viewControllers.first as! RepoDetailViewController

        repoDetailViewController.repository = self.selectedRepository
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let repoDetailViewController = self.viewControllers.first as! RepoDetailViewController

        repoDetailViewController.repository = self.selectedRepository
    }
}
