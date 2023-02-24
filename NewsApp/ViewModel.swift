//
//  ViewModel.swift
//  APIPractice
//
//  Created by Devanshu Dev Chaudhary on 12/02/23.
//

import Foundation
import SwiftUI

enum newsCases: String {
    
    case top, breaking, sports, business
    
}


extension NewsList {
    
    func fetchNews(_ query: String?) {
        
        if let string = query?.trimmingCharacters(in: .whitespaces) {
                        
            APIManager.shared.fetchNewsData(searchQuery: string) { result in
                switch result {
                case .success(let result):                    
                    if let articles = result["articles"] as? [[String:Any]] {
                        DispatchQueue.main.async {
                            for article in articles {
                                newsList.append(NewsModel(article))
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

