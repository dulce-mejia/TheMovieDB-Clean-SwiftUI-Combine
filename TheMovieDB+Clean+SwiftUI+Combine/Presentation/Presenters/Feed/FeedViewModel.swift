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
    @Published var sections: [FeedSectionViewModel] = []
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    // Getting data using Async Binding
    @MainActor public func loadFeed() async {
        do {
            async let nowPlaying = getContentBySection(.nowPlaying)
            async let popular = getContentBySection(.popular)
            async let trending = getContentBySection(.trending)
            async let topRated = getContentBySection(.topRated)
            async let upcoming = getContentBySection(.upcoming)
            self.sections = try await [nowPlaying, popular, trending, topRated, upcoming]
            
        } catch(let error as APIError) {
            print("error en loadFeed: \(error.localizedDescription)")
        } catch (let error) {
            print("another error ocurred: ", error.localizedDescription)
        }
    }
    
    // Loading data using AsyncSequence and AsyncIteratorProtocol
    @MainActor public func loadFeedSequence() async throws {
        let sections = FeedType.allCases
        
        for try await feedViewModel in FeedSections(feedLoader: feedLoader, sections: sections) {
            self.sections.append(feedViewModel)
        }
    }
    
    private func getContentBySection(_ section: FeedType) async throws -> FeedSectionViewModel {
        let endpoint = getFeedType(section)
        let movies = try await feedLoader.loadFeed(endpoint)
        return FeedSectionViewModel(section: section, content: movies)
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
