//
//  FeedType.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

public enum FeedType: Int, CaseIterable {
    case nowPlaying
    case trending
    case popular
    case topRated
    case upcoming
    
    var sectionTitle: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .trending:
            return "Trending"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        }
    }
}
