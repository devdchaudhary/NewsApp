//
//  APIManager.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    public typealias CompletionHandler = (_ response: Result<[String: Any], Error>) -> Void
    
    func fetchNewsData(searchQuery: String, comp: @escaping CompletionHandler) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchQuery)&apiKey=\(Constants.token)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            do {
                if let data {
                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                    if let json = json {
                        comp(.success(json))
                    }
                }
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}
