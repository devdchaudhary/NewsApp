//
//  SourceModel.swift
//  NewsApp
//
//  Created by Devanshu Dev Chaudhary on 14/02/23.
//

import Foundation

struct SourceModel: Decodable {
    
    var uid: UUID
    var sourceName: String
    
    init(_ data: [String : Any]) {
        
        uid = UUID()
        sourceName = data["name"] as? String ?? ""
        
    }
}
