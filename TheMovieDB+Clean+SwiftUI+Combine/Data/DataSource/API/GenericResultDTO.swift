//
//  GenericResultDTO.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import Foundation

public struct GenericResultDTO<T: Codable>: Codable {
    let page: Int
    var results: [T]
}
