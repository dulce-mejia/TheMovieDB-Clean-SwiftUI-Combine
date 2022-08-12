//
//  APIError.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

enum APIError: Error {
    case badUrl, requestFailed, decodingError, connectivity, unexpectedStatusCode
    
    var localizedDescription: String {
        switch self {
        case .badUrl:
            return "bad URL"
        case .requestFailed:
            return "Request failed"
        case .decodingError:
            return "Error decoding data"
        case .connectivity:
            return "Connection lost"
        case .unexpectedStatusCode:
            return "Server error"
        }
    }
}
