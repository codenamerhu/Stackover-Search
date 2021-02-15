//
//  SearchViewModel.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation
import UIKit

class SearchViewModel : NSObject {
    
    var questions: Questions!
    let apiClient = APIClient()
    var dataChange: (() -> Void)?
    var pageNum = 1
    var pageSize = 0
    
    var searchTag: String? {
        didSet {
            self.searchQuestion(urlString: Constants.baseurl + Constants.apiVersion + "/questions", tag: searchTag)
            dataChange?()
        }
    }
    
    func searchQuestion(urlString: String, tag: String? ) {
        
        guard let tag = tag, !tag.isEmpty else {
            return
        }
        
        apiClient.get(tag: tag, urlString: urlString, pageNum:pageNum, pageSize: pageSize, completion: { [self] (questions, error) in
            
            self.questions = questions
            dataChange?()
        })
    }
    
    func numberoOfItems() -> Int {
        if let count = questions?.items {
            
            return count.count + pageSize
        } else {
            return 0
        }
    }
    
}

extension SearchViewModel : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberoOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "search_result_cell", for: indexPath) as! SearchResultTableViewCell
        
        if let items = questions.items?[indexPath.row] {
            cell.configureData(items: items)
        }
        
        return cell
    }
}

func replaceSymbol(string: String) -> String {
    return string.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
}
