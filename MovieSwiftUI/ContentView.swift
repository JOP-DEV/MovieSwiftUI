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
            Tab("Home", systemImage: "house") {
                Text("Home")
            }
            Tab("Upcoming", systemImage: "play.circle.fill") {
                Text("Upcoming")
            }
            Tab("Search", systemImage: "magnifyingglass") {
                Text("Search")
            }
            Tab("Download", systemImage: "arrow.down.to.line") {
                Text("Download")
            }
        }
    }
}

#Preview {
    ContentView()
}
