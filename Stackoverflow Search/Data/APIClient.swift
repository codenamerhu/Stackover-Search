//
//  APIClient.swift
//  Stackoverflow Search
//
//  Created by Rhulani Ndhlovu on 2021/02/13.
//

import Foundation

class APIClient : APIClientProtocol {
    
    let urlSession = URLSession.shared
    public static let shared = APIClient()
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
     var pSize = 20
    
    func get(tag: String, urlString: String, pageNum: Int, pageSize: Int, completion: @escaping (Questions, Error?) -> Void) {
        
        pSize += pageSize
        print("page size \(pageSize)")
        var urlBuilder = URLComponents(string: urlString)
        urlBuilder?.queryItems = [
            URLQueryItem(name: "pagesize", value: String(pSize)),
            URLQueryItem(name: "page", value: String(pageNum)),
            URLQueryItem(name: "sort", value: "activity"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "tagged", value: tag),
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "filter", value: "withbody"),
        ]
        
        guard let url = urlBuilder?.url else {
            return
        }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        urlSession.dataTask(with: request) { [self] (data, response, error) in
            
            guard error == nil else {
                // completion
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let questions   = try jsonDecoder.decode(Questions.self, from: data)
                DispatchQueue.main.async {
                    completion(questions, nil)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        } .resume()
    }

}
