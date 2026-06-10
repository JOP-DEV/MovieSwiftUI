//
//  Errors.swift
//  MovieSwiftUI
//
//  Created by Pinedo on 10/06/26.
//

import Foundation

// MARK: - APIConfig Errors
enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode data: \(error.localizedDescription)"
        case .fileNotFound:
            return "File not found"
        }
    }
}
