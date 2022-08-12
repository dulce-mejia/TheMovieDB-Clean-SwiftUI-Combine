//
//  Movie.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

struct Movie: Identifiable {
   let id: Int
   let backdropPath: String?
   let voteCount: Int
   let originalTitle: String
   let posterPath: String?
   let title: String?
   let voteAverage: Double
   let releaseDate: String?
   let overview: String?

    init(id: Int,
                backdropPath: String?,
                voteCount: Int,
                originalTitle: String,
                posterPath: String?,
                title: String?,
                voteAverage: Double,
                releaseDate: String?,
                overview: String?) {
        self.id = id
        self.backdropPath = backdropPath
        self.voteCount = voteCount
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.title = title
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
