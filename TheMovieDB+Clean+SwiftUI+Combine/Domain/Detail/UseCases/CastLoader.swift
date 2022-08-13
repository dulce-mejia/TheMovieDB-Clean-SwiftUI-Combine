//
//  CastLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

protocol CastLoader {
    func load(movieId: Int) async throws -> [Cast]
}
