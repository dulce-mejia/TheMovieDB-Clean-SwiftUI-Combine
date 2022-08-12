//
//  FeedSectionViewModel.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

struct FeedSectionViewModel {
    let section: FeedType
    let content: [Movie]
    
    init(section: FeedType, content: [Movie]) {
        self.section = section
        self.content = content
    }
}

struct FeedSections: AsyncSequence {
    typealias Element = FeedSectionViewModel
    
    let sections: [FeedType]
    let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader, sections: [FeedType]) {
        self.sections = sections
        self.feedLoader = feedLoader
    }
    
    func makeAsyncIterator() -> FeedSectionIterator {
        return FeedSectionIterator(feedLoader: feedLoader, sections: sections)
    }
}

struct FeedSectionIterator: AsyncIteratorProtocol {
    typealias Element = FeedSectionViewModel
    private var index: Int = 0
    
    let sections: [FeedType]
    let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader, sections: [FeedType]) {
        self.sections = sections
        self.feedLoader = feedLoader
    }
    
    mutating func next() async throws -> FeedSectionViewModel? {
        defer {
            index += 1
        }
        guard index < sections.count else { return nil }
        let feedType = sections[index]
        let movies = try await feedLoader.loadFeed(getFeedEndpoint(feedType))
        return FeedSectionViewModel(section: feedType, content: movies)
    }
    
    private func getFeedEndpoint(_ type: FeedType) -> FeedEndpoint {
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
