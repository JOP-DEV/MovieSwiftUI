//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 9/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.home, systemImage: "house") {
                HomeView()
            }
            Tab(Constants.upComing, systemImage: "play.circle.fill") {
                Text(Constants.upComing)
            }
            Tab(Constants.search, systemImage: "magnifyingglass") {
                Text(Constants.search)
            }
            Tab(Constants.download, systemImage: "arrow.down.to.line") {
                Text(Constants.download)
            }
        }
    }
}

#Preview {
    ContentView()
}
