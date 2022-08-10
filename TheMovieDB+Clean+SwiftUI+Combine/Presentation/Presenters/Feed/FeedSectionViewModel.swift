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
