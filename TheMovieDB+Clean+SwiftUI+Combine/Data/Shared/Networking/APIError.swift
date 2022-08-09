//
//  APIError.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

enum APIError: Error {
    case badUrl, requestFailed, decodingError, connectivity, unexpectedStatusCode
}
