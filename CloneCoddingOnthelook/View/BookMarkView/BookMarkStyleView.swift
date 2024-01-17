//
//  BookMarkVIew.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct BookMarkStyleView: View {
    @EnvironmentObject private var dataModel: DataModel
    var gridItems = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(dataModel.cards.indices, id: \.self) { cardIndex in
                        if dataModel.cards[cardIndex].bookMarked {
                            NavigationLink {
                                DetailCardView(cardIndex: cardIndex)
                            } label: {
                                CardView(image: dataModel.cards[cardIndex].image)
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
        .environmentObject(DataModel())
}
