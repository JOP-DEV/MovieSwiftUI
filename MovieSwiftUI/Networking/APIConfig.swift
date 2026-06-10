//
//  APIConfig.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String  
    
    static let shared: APIConfig = {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            fatalError("APIConfig.json is missing or invalid")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(APIConfig.self, from: data)
        } catch {
            fatalError("Failed to load or decode APIConfig.json: \(error.localizedDescription)")
        }
    }()
}
