//
//  SearchViewViewController.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import UIKit

class SearchViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var isDataLoading:Bool=false
    var pageNo:Int=0
    var limit:Int=0
    var offset:Int=0 //pageNo*limit
    var didEndReached:Bool=false
    var tag = ""
    
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
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

            print("scrollViewWillBeginDragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

                if ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
                {
                    if tag != "" {
                        self.pageNo = self.pageNo+1
                        self.limit=self.limit + 10
                        searchViewModel.searchTag = tag
                        searchViewModel.pageNum = self.pageNo
                        searchViewModel.pageSize = self.limit
                        tableView.dataSource = searchViewModel
                    }
                }


        }
}

extension SearchViewViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        tag = searchController.searchBar.text!
        searchViewModel.searchTag = tag
        
        
    }
}
