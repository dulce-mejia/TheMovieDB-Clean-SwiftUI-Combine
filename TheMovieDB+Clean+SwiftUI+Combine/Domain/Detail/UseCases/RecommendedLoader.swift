//
//  RecommendedLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

protocol RecommendedLoader {
    func load(movieId: Int) async throws -> [Movie]
}
