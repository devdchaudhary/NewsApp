//
//  NewsArticleView.swift
//  NewsApp
//
//  Created by Devanshu Dev Chaudhary on 14/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsArticleView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var news: NewsModel
    @State var articleClicked: Bool = false
    
    var body: some View {
        
        NavigationLink(destination: NewsDetailView(news: news), isActive: $articleClicked) {
            EmptyView()
        }
        .opacity(0)
        .frame(width: 0, height: 0)
        .hidden()
        
        Button(action: newsDetailView) {
            
            VStack {
                
                Text(news.source.sourceName)
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.vertical, 10)
                
                if let url = news.imageUrl {
                    
                    WebImage(url: url, options: .refreshCached)
                        .placeholder(
                            Image(systemName: "newspaper.fill")
                        )
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(30)
                        .clipped()
                    
                }
                
                HStack {
                    
                    Text(news.title)
                        .font(.title3.bold())
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.vertical, 10)
                    
                    Spacer()
                    
                }
            }
            .padding(.horizontal, 10)
        }
    }
    
    private func newsDetailView() {
        articleClicked.toggle()
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(news: NewsModel(.init()))
    }
}
