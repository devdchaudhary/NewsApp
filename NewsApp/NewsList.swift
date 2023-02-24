//
//  NewsList.swift
//  NewsApp
//
//  Created by dddiehard on 15/02/23.
//

import SwiftUI

struct NewsList: View {
    
    @State var index: Int
    @State var isSearched: Bool = false
    @State var query: String?
    @State var newsList: [NewsModel] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(newsList, id: \.uid) { news in
                    NewsArticleView(news: news)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    
                }
            }
            .listStyle(.inset)
            .onAppear {
                switch index {
                case 1:
                    fetchNews(newsCases.top.rawValue)
                case 2:
                    fetchNews(newsCases.breaking.rawValue)
                case 3:
                    fetchNews(newsCases.sports.rawValue)
                case 4:
                    fetchNews(newsCases.business.rawValue)
                case 5:
                    fetchNews(query)
                default:
                    return
                }
            }
            .refreshable {
                switch index {
                case 1:
                    fetchNews(newsCases.top.rawValue)
                case 2:
                    fetchNews(newsCases.breaking.rawValue)
                case 3:
                    fetchNews(newsCases.sports.rawValue)
                case 4:
                    fetchNews(newsCases.business.rawValue)
                case 5:
                    fetchNews(query)
                default:
                    return
                }
            }
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .systemTeal
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList(index: 0, isSearched: false, query: "", newsList: [NewsModel.init([:])])
    }
}
