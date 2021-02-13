//
//  SearchViewModel.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

class SearchViewModel {
    
    var questions: Questions?
    let apiClient = APIClient()
    
    func seachQuestion(urlString: String, tag: String? ) {
        
        guard let tag = tag, !tag.isEmpty else {
            return
        }
        
        apiClient.get(tag: tag, urlString: urlString, completion: {(questions, error) in
            
        })
    }
}
