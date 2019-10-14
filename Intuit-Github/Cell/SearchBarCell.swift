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
        
        searchBar.delegate = self
    }
}

extension SearchBarCell: UISearchBarDelegate{
    
   func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidBeginEditing")
        delegate.searchBarTextDidBeginEditing?(searchBar)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing")
        delegate.searchBarTextDidEndEditing?(searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked")
        delegate.searchBarCancelButtonClicked!(searchBar)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        delegate.searchBarSearchButtonClicked!(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange")
        delegate.searchBar?(searchBar, textDidChange: searchText)
    }
    
}

