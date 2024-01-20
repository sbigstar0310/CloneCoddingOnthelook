//
//  BookMarkLikeView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/20/24.
//

import SwiftUI

struct BookMarkLikeView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    var gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(dataModel.cards) { card in
                        if card.liked {
                            NavigationLink {
                                DetailCardView(cardId: card.id)
                            } label: {
                                CardView(image: card.image)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookMarkLikeView()
        .environmentObject(TestDataModel())
}
