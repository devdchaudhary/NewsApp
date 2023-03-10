//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by devdchaudhary on 14/02/23.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NewsFeed()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
