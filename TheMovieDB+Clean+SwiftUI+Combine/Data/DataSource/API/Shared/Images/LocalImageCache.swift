//
//  LocalImageCache.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 11/08/22.
//

import Foundation

public final class LocalImageCache: ImageCache {
    typealias CacheType = NSCache<NSURL, NSData>
    
    enum CacheError: Error {
        case noImageWithThatKey
        
        var localizedDescription: String {
            switch self {
            case .noImageWithThatKey:
                return "Cached data not found"
            }
        }
    }
    
    lazy var cache: CacheType = {
        let cache = CacheType()
        cache.countLimit = 75
        return cache
    }()
    
    public func load(url: URL) throws -> Data {
        guard let data = cache.object(forKey: url as NSURL) else {
            throw CacheError.noImageWithThatKey
        }
        return data as Data
    }
    
    public func save(data: Data, with url: URL) {
        cache.setObject(data as NSData, forKey: url as NSURL)
    }
    
    
}
