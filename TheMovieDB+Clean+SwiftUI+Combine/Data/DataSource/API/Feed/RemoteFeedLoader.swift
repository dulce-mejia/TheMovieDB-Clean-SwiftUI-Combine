//
//  RemoteFeedLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 08/08/22.
//

import Foundation

final class RemoteFeedLoader: FeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func loadFeed(_ feedType: FeedType) async throws -> [Movie] {
        guard let url = feedType.urlComponents?.url else {
            throw APIError.badUrl
        }
        
        let requestResult = try await client.get(from: url)
        
        guard let (data, _) = try? requestResult.get() else {
            throw APIError.requestFailed
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode([MovieDTO].self, from: data) else {
            throw APIError.decodingError
        }
        
        return result.map { Movie(id: $0.id,
                                  backdropPath: $0.backdropPath,
                                  voteCount: $0.voteCount,
                                  originalTitle: $0.originalTitle,
                                  posterPath: $0.posterPath,
                                  title: $0.title,
                                  voteAverage: $0.voteAverage,
                                  releaseDate: $0.releaseDate,
                                  overview: $0.overview) }
    }
}
