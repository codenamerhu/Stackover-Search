//
//  APIClient.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

class APIClient : APIClientProtocol {
    
    let urlSession = URLSession.shared
    
    func get(query: String, urlString: String, completion: @escaping (Questions?, Error?) -> Void) {
        
        var urlBuilder = URLComponents(string: urlString)
        urlBuilder?.queryItems = [
        ]
        
        guard let url = urlBuilder?.url else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request) { (data, response, error) in
            
        } .resume()
        
    }
    
    
    
    
}
