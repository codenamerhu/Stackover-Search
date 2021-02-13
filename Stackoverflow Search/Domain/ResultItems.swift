//
//  ResultItemsModel.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

struct Items : Codable {
    
    let owner: Owner?
    let is_answered: Bool?
    let view_count: Int?
    let answer_count: Int?
    let score: Int?
    let last_activity_date: Int?
    let creation_date: Int?
    let last_edit_date: Int?
    let question_id: Int?
}
