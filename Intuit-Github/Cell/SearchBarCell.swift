//
//  SearchBarCell.swift
//  Intuit-Github
//
//  Created by Romario Latty on 10/9/19.
//  Copyright © 2019 Romario Latty. All rights reserved.
//

import Foundation
import UIKit
class SearchBarCell: UITableViewCell {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var delegate: UISearchBarDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchBar.delegate = delegate
    }
}
