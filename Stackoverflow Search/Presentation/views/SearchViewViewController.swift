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
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = searchViewModel
        
        
        tableView.register(UINib(nibName: "SearchResultTableViewCell", bundle: nil), forCellReuseIdentifier: "search_result_cell")
        tableView.rowHeight =  80.0
        
        
        searchViewModel.dataChange = { [weak self] in
            self?.tableView.reloadData()
            print("hello \(self!.searchViewModel.numberoOfItems())")
        }
        
    
        
        tableView.delegate = self
        tableView.dataSource = searchViewModel
        tableView.tableFooterView = UIView()
    }
    
    

}

extension SearchViewViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "detailView") as! QuestionDetailViewViewController
        detailView.question = searchViewModel.questions.items?[indexPath.row]
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
