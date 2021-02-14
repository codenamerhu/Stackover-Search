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
    
    func seachQuestion(urlString: String, tag: String? ) {
        
        guard let tag = tag, !tag.isEmpty else {
            return
        }
        
        apiClient.get(tag: tag, urlString: urlString, completion: { [self] (questions, error) in
            
            //print("qs are \(questions)")
            self.questions = questions
            dataChange?()
        })
    }
    
    func numberoOfItems() -> Int {
        if let count = questions?.items {
            
            return count.count
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
        
        cell.title.text = questions.items?[indexPath.row].title
        
        if let username = questions.items?[indexPath.row].owner?.display_name {
            cell.askedBy.text = "asked by " + username
        }
        
        if let score = questions.items?[indexPath.row].score {
            cell.votedNumberLabel.text = String(score) + " Votes"
        }
        
        
        
        if let views = questions.items?[indexPath.row].view_count {
            cell.viewedNumberlabel.text = String(views) + " Views"
        }
        
        if let _ = questions.items?[indexPath.row].accepted_answer_id {
            cell.tileLeadingConstraint.constant = 30
            cell.askedByLeadingConstraint.constant = 30
            cell.acceptedImage.isHidden = false
        }
        
        
        
        return cell
    }
}

extension SearchViewModel : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let tag = searchController.searchBar.text {
            self.seachQuestion(urlString: Constants.baseurl + Constants.apiVersion + "/questions", tag: tag)
            dataChange?()
        }
        
        
    }
}

func replaceSymbol(string: String) -> String {
    return string.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
}
