//
//  BookMarkVIew.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct BookMarkView: View {
    @EnvironmentObject private var cardsData: Cards
    var gridItems = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("북마크")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(cardsData.cards.indices, id: \.self) { cardIndex in
                        if cardsData.cards[cardIndex].bookMarked {
                            NavigationLink {
                                DetailCardView(cardIndex: cardIndex)
                            } label: {
                                CardView(image: cardsData.cards[cardIndex].image)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BookMarkView()
        .environmentObject(Cards())
}
