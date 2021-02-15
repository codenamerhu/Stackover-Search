//
//  SearchViewViewController.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import UIKit

class SearchViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    var searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusBarColorChange (view: view, color: customBlue!, textTheme: "light")
        self.navigationController?.navigationBar.backgroundColor = customBlue
        
        
        setUpSearchControlller()
        
        
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "search_result_cell")
        tableView.rowHeight =  80.0
        
        
        searchViewModel.dataChange = { [weak self] in
            self?.tableView.reloadData()
        }
    
        
        tableView.delegate = self
        tableView.dataSource = searchViewModel
        tableView.tableFooterView = UIView()
    }
    
    func setUpSearchControlller(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.searchTextField.backgroundColor = .white
    }
    
    func setupDataToUI(){
        
    }

}

extension SearchViewViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "detailView") as! QuestionDetailViewViewController
        detailView.question = searchViewModel.questions.items?[indexPath.row]
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

extension SearchViewViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let tag = searchController.searchBar.text {
            searchViewModel.searchTag = tag
        }
        
        
    }
}
