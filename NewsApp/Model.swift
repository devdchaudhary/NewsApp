//
//  Model.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import Foundation

struct NewsModel: Decodable {
    
    var uid: UUID
    var id: String
    var source: SourceModel
    var author: String
    var title: String
    var description: String
    var imageUrl: URL?
    var publishedAt: Date
    
    init(_ data: [String : Any]) {
        
        uid = UUID()
        id = data["id"] as? String ?? ""
        
        let sourceData = data["source"] as? [String:Any] ?? [:]
        source = SourceModel(sourceData)
        
        author = data["author"] as? String ?? "Unknown"
        title = data["title"] as? String ?? ""
        description = data["description"] as? String ?? ""
        
        let image = data["urlToImage"] as? String ?? ""
        imageUrl = URL(string: image)
        
        publishedAt = data["publishedAt"] as? Date ?? .now
    }
}
