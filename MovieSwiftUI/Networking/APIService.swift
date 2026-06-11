//
//  APIService.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation

struct APIService {
    let tmdbBaseUrl = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    func fetchTitles(for media: String, by type: String) async throws -> [Title] {
        let fetchTitlesURL = try buildURL(media: media, type: type)
        guard let fetchTitlesURL = fetchTitlesURL else {
            throw NetworkError.urlBuildFailed
        }
        
        let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "APIService",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? 0,
                userInfo: [NSLocalizedDescriptionKey: "Invalid response from API"]))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(Titles.self, from: data).results
        Title.addPosterPath(to: &titles)
        return titles
    }
    
    private func buildURL(media: String, type: String) throws -> URL? {
        guard let baseURL = tmdbBaseUrl else {
            throw NetworkError.missingConfig
        }
        
        guard let APIkey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        var path: String
        
        switch type {
        case "trending":
            path = "3/trending/\(media)/day"
        case "top_rated":
            path = "3/\(media)/top_rated"
        case "popular":
            path = "3/\(media)/popular"
        default:
            throw NetworkError.urlBuildFailed
        }
                
        guard let url = URL(string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: APIkey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        return url
    }
}
