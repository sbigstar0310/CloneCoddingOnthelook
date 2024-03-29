//
//  BookMarkVIew.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct BookMarkStyleView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    var gridItems = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(dataModel.cards) { card in
                        if card.bookMarked {
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
    BookMarkStyleView()
        .environmentObject(TestDataModel())
}
