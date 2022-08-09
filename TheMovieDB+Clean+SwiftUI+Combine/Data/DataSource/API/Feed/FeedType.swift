//
//  FeedType.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

public enum FeedType: Int, CaseIterable, Endpoint {
    case nowPlaying
    case trending
    case popular
    case topRated
    case upcoming

    public var path: String {
        switch self {
        case .nowPlaying:
            return "/movie/now_playing"
        case .trending:
            return "/trending/movie/day"
        case .popular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        }
    }
}
