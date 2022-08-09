//
//  FeedLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

protocol FeedLoader {
    func loadFeed(_ feedType: FeedEndpoint) async throws -> [Movie]
}
