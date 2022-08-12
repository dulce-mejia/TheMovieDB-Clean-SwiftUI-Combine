//
//  ImageLoader.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 11/08/22.
//

import Foundation

public protocol ImageLoader {
    func load(url: URL) async throws -> Data
}
