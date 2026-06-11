//
//  ViewModel.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case loading
        case success
        case failure(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let apiService = APIService()
    
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRateMovies: [Title] = []
    var topRateTV: [Title] = []
    
    func getTitles() async {
        homeStatus = .loading
        
        do {
            trendingMovies = try await apiService.fetchTitles(for: "movie", by: "trending")
            trendingTV = try await apiService.fetchTitles(for: "tv", by: "trending")
            topRateMovies = try await apiService.fetchTitles(for: "movie", by: "top_rated")
            topRateTV = try await apiService.fetchTitles(for: "tv", by: "top_rated")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failure(underlyingError: error)
        }
    }
}
