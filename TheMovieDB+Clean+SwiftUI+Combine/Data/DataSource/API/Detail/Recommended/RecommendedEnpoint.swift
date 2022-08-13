//
//  RecommendedEnpoint.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

struct RecommendedEndpoint: Endpoint {
    var path: String {
        "/3/movie/\(movieId)/recommendations"
    }

    let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }
}
