//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 9/06/26.
//

import SwiftUI

struct HomeView: View {
    var testTitle = Constants.testTitleURL
    
    var body: some View {
        ScrollView {
            LazyVStack {
                AsyncImage(url: URL(string: testTitle)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(10)
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Text(Constants.play)
                            .ghostButton()
                    }
                    
                    Button {
                        
                    } label: {
                        Text(Constants.download)
                            .ghostButton()
                    }
                }
                
                HListView(header: Constants.trendingMovies)
                HListView(header: Constants.trendingTv)
                HListView(header: Constants.topRateMovies)
                HListView(header: Constants.topRateTv)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
