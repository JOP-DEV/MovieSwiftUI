//
//  HomeView.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 9/06/26.
//

import SwiftUI

struct HomeView: View {
    var testTitle = Constants.testTitleURL
    let viewModel = ViewModel()
    
    var body: some View {
        ScrollView (.vertical) {
            switch viewModel.homeStatus {
            case .notStarted:
                EmptyView()
            case .loading:
                ProgressView()
            case .success:
                LazyVStack {
                    AsyncImage(url: URL(string: testTitle)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(10)
                            .overlay {
                                LinearGradient(
                                    stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .gradient, location: 1)],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            }
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
                    
                    HListView(header: Constants.trendingMovies, titles: viewModel.trendingMovies)
                    HListView(header: Constants.trendingTv, titles: viewModel.trendingTV)
                    HListView(header: Constants.topRateMovies, titles: viewModel.topRateMovies)
                    HListView(header: Constants.topRateTv, titles: viewModel.topRateTV)
                    
                }
            case .failure(let error):
                Text("Error loading: \(error)")
            }
        }
        .task {
            await viewModel.getTitles()
        }
    }
}

#Preview {
    HomeView()
}
