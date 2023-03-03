//
//  ContentView.swift
//  NewsApp
//
//  Created by devdchaudhary on 14/02/23.
//

import SwiftUI

struct NewsFeed: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var searchQuery: String = ""
    @State private var topText = "Top"
    @State private var breakingText = "Breaking"
    @State private var sportsText = "Sports"
    @State private var businessText = "Business"
    
    @State var isSearched = false
    @State var selection = 1
        
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 10)
            
            HStack {
                
                HStack {
                    
                    TextField("Search", text: $searchQuery)
                        .submitLabel(.search)
                        .onSubmit {
                            searchClicked(searchQuery)
                            hideKeyboard()
                        }
                        .onChange(of: searchQuery) { query in
                            
                            if query == "" {
                                isSearched = false
                                switch selection {
                                case 1:
                                    topText = newsCases.top.rawValue
                                case 2:
                                    breakingText = newsCases.breaking.rawValue
                                case 3:
                                    sportsText = newsCases.sports.rawValue
                                case 4:
                                    businessText = newsCases.business.rawValue
                                default:
                                    topText = newsCases.top.rawValue
                                }
                                hideKeyboard()
                            }
                        }
                    
                    Spacer()
                    
                    Button(action: {
                        searchClicked(searchQuery)
                    }) {
                        Image(systemName: "magnifyingglass").foregroundColor(.black)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(30)
                
            }
            .padding(.horizontal, 10)
            
            HStack {
                
                Button(action: {
                    withAnimation {
                        selection = 1
                    }
                }) {
                    VStack(spacing: 10) {
                        Text(topText)
                            .font(.system(size: 13).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selection == 1 ? .blue : .clear)
                    }
                }
                
                Button(action: {
                    withAnimation {
                        selection = 2
                    }
                }) {
                    VStack(spacing: 10) {
                        Text(breakingText)
                            .font(.system(size: 13).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selection == 2 ? .blue : .clear)
                    }
                }
                
                Button(action: {
                    withAnimation {
                        selection = 3
                    }
                }) {
                    VStack(spacing: 10) {
                        Text(sportsText)
                            .font(.system(size: 13).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selection == 3 ? .blue : .clear)
                    }
                }
                
                Button(action: {
                    withAnimation {
                        selection = 4
                    }
                }) {
                    VStack(spacing: 10) {
                        Text(businessText)
                            .font(.system(size: 13).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selection == 4 ? .blue : .clear)
                    }
                }
            }
            .padding(.all, 10)
            
            TabView(selection: $selection) {
                
                if isSearched {
                    
                NewsList(index: 5, isSearched: isSearched, query: searchQuery)
                    .tag(1)
                    
                } else {
                    
                NewsList(index: 1, query: nil)
                    .tag(1)
                    
                }
                
                if isSearched {
                    
                NewsList(index: 5, isSearched: isSearched, query: searchQuery)
                    .tag(1)
                    
                } else {
                    
                    NewsList(index: 2, query: nil)
                        .tag(2)
                    
                }
                
                if isSearched {
                    
                NewsList(index: 5, isSearched: isSearched, query: searchQuery)
                    .tag(1)
                    
                } else {
                    
                    
                    NewsList(index: 3, query: nil)
                        .tag(3)
                    
                }

                if isSearched {
                    
                NewsList(index: 5, isSearched: isSearched, query: searchQuery)
                    .tag(1)
                    
                } else {
                    
                    NewsList(index: 4, query: nil)
                        .tag(4)

                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
    
    private func searchClicked(_ query: String) {
        
        isSearched = true
        
        switch selection {
        case 1:
            topText = query
        case 2:
            breakingText = query
        case 3:
            sportsText = query
        case 4:
            businessText = query
        default:
            topText = query
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            NewsFeed()
        }
        
    }
    
}

