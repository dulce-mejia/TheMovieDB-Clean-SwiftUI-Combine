//
//  MovieDTO.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

struct MovieDTO: Codable {
    let id: Int
    let backdropPath: String?
    let voteCount: Int
    let originalTitle: String
    let posterPath: String?
    let title: String?
    let voteAverage: Double
    let releaseDate: String?
    let overview: String?
}
