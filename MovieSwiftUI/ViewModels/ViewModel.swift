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
    
    func getTitles() async {
        homeStatus = .loading
        
        do {
            trendingMovies = try await apiService.fetchTitles(for: "movie")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failure(underlyingError: error)
        }
    }
}
