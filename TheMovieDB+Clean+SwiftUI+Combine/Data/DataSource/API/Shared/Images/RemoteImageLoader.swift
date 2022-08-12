//
//  RemoteImageLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 11/08/22.
//

import Foundation

public final class RemoteImageLoader: ImageLoader {
    private let base = "https://image.tmdb.org/t/p/"
    
    enum ImageLoaderError: Error {
        case badUrl
    }
    
    private let client: HTTPClient
    private let cache: ImageCache
    
    init(client: HTTPClient, cache: ImageCache) {
        self.client = client
        self.cache = cache
    }
    
    public func load(url: URL) async throws -> Data {
        guard let cachedImage = try? cache.load(url: url) else {
            let result = try await client.get(from: url)
            switch result {
            case .success(let (data, _)):
                return data
            case .failure(let error):
                throw error
            }
        }
        return cachedImage
    }
}
