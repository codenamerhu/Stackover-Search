//
//  SearchViewViewController.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import UIKit

class SearchViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let searchController = UISearchController(searchResultsController: nil)
    var searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "search_result_cell")
        tableView.rowHeight =  80.0
        
        
        searchViewModel.dataChange = { [weak self] in
            self?.tableView.reloadData()
            print("hello \(self!.searchViewModel.numberoOfItems())")
        }
        searchViewModel.seachQuestion(urlString: Constants.baseurl + Constants.apiVersion + "/questions", tag: "swift")
    
        
        tableView.delegate = self
        tableView.dataSource = searchViewModel
        tableView.tableFooterView = UIView()
    }

}

extension SearchViewViewController : UITableViewDelegate { }
