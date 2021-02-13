//
//  APIClientProtocol.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

protocol APIClientProtocol {
    
    func get(params: [String], urlString: String, completion: @escaping (Questions?, Error?) -> Void )
}
