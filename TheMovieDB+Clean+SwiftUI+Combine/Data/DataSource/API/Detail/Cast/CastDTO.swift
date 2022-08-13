//
//  CastDTO.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 12/08/22.
//

import Foundation

struct CreditsDTO: Codable {
    var id: Int
    var cast: [CastDTO]
}

struct CastDTO: Codable {
    var name: String
    var profilePath: String?

    var cast: Cast {
        Cast(name: name, profilePath: profilePath)
    }
}
