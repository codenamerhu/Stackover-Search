//
//  ResultItemsModel.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

struct Items : Codable {
    
    let owner: Owner?
    let tags: [String]
    let is_answered: Bool?
    let view_count: Int?
    let answer_count: Int?
    let score: Int?
    let last_activity_date: Double?
    let creation_date: Double?
    let last_edit_date: Double?
    let question_id: Int?
    let content_license: String?
    let link: String?
    let title: String?
    let body: String?
    let accepted_answer_id: Int?
}
