//
//  Questions.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

struct Questions : Codable {
    
    let items: [Items]?
    
    /*
    enum CodingKeys: String, CodingKey {
        case items = "items"
    } */
}