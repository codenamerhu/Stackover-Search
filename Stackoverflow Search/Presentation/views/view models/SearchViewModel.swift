//
//  SearchViewModel.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

class SearchViewModel {
    
    var questions: Questions?
    
    func seachQuestion(urlString: String?, query: String? ) {
        guard let query = query, !query.isEmpty else {
            return
        }
    }
}
