//
//  ImageCache.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 11/08/22.
//

import Foundation

public protocol ImageCache {
    func load(url: URL) throws -> Data
    func save(data: Data, with url: URL)
}
