//
//  FeedViewModel.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation
import Combine

final class FeedViewModel: ObservableObject {
    
    let feedLoader: FeedLoader
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    private enum FeedType: Int, CaseIterable {
        case nowPlaying
        case trending
        case popular
        case topRated
        case upcoming
    }
    
    public func loadFeed() async -> [Movie] {
        do {
            let movies = try await feedLoader.loadFeed(.popular)
            print("Movies: ", movies)
            return movies
        } catch(let error as APIError) {
            print("error en loadFeed: \(error.localizedDescription)")
            return []
        } catch (let error) {
            print("another error ocurred: ", error.localizedDescription)
            return []
        }
    }
    
    private func getFeedType(_ type: FeedType) -> FeedEndpoint {
        switch type {
        case .nowPlaying:
            return .nowPlaying
        case .trending:
            return .trending
        case .popular:
            return .popular
        case .topRated:
            return .topRated
        case .upcoming:
            return .upcoming
        }
    }
}
