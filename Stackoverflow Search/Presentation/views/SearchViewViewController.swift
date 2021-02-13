//
//  SearchViewViewController.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import UIKit

class SearchViewViewController: UIViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    let searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        searchViewModel.seachQuestion(urlString: Constants.baseurl + Constants.apiVersion + "/questions", tag: "swift")
        
    }

}
