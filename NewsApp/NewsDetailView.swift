//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Devanshu Dev Chaudhary on 14/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    var news: NewsModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                                
                HStack {
                    
                    Button(action: backbuttonClicked, label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    })
                    
                    Spacer()
                    
                    Text(news.source.sourceName)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.clear)
                        .padding(.trailing, 10)
                    
                }
                .padding(.vertical, 10)
                
                Text(news.publishedAt.formatted(date: .complete, time: .omitted))
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.vertical, 10)
                                
                Text("By \(news.author)")
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.vertical, 10)
                
                Text(news.title)
                    .font(.title2)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.vertical, 10)
                
                if let url = news.imageUrl {
                    
                    WebImage(url: url, options: .refreshCached)
                        .placeholder(Image(systemName: "arrow.up"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                        .clipped()
                    
                }
                
                Text(news.description)
                    .font(.system(size: 18))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                
                Spacer()

            }
            .padding()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private func backbuttonClicked() {
        dismiss()
    }
    
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: NewsModel(.init()))
    }
}
