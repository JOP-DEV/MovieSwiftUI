//
//  APIService.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation

let tmdbBaseUrl = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey

func fetchTitles(for media:String) async throws -> [Title] {
    guard let baseURL = tmdbBaseUrl else {
        throw NetworkError.missingConfig
    }
    
    guard let APIkey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }
    
   guard let fetchTitlesURL = URL(string: baseURL)?
        .appending(path: "3/trending/\(media)/day")
        .appending(queryItems: [
            URLQueryItem(name: "api_key", value: APIkey)
        ]) else {
       throw NetworkError.urlBuildFailed
   }
    
    print(fetchTitlesURL)
    
    let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
    
    guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkError.badURLResponse(underlyingError: NSError(
            domain: "APIService",
            code: (urlResponse as? HTTPURLResponse)?.statusCode ?? 0,
            userInfo: [NSLocalizedDescriptionKey: "Invalid response from API"]))
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(Titles.self, from: data).results
}
