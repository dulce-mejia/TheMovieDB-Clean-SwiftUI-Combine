//
//  FeedSectionView.swift
//  TheMovieDB+Clean+SwiftUI+Combine
//
//  Created by Gardenia Mejia on 09/08/22.
//

import SwiftUI

struct FeedSectionView: View {
    let layout = [
        GridItem(.fixed(175))
    ]
    let viewModel: FeedSectionViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(viewModel.section.sectionTitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout, spacing: 10) {
                    ForEach(viewModel.content) { movie in
                        MovieView(movie: movie)
                            .aspectRatio(0.75, contentMode: .fit)
                    }
                }
            }
        }
        .frame(height: 190)
    }
}

struct FeedSection_Previews: PreviewProvider {
    static let section = FeedSectionViewModel(section: .popular, content: [])
    static var previews: some View {
        FeedSectionView(viewModel: section)
            .previewLayout(.sizeThatFits)
    }
}
