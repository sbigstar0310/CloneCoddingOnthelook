//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject private var cardsData: Cards
    var cardIndex: Int
    
    var body: some View {
        let card = cardsData.cards[cardIndex]
        let profile = card.profile
        
        NavigationStack {
            ScrollView {
                HStack {
                    Image(profile.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment:.leading) {
                        Text(profile.name)
                            .fontWeight(.bold)
                        HStack {
                            Text("\(profile.height)cm")
                            Text("\(profile.weight)kg")
                            Text(profile.job)
                        }
                        .font(.footnote)
                        .fontWeight(.light)
                    }
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("팔로잉")
                    })
                    .buttonStyle(.bordered)
                }
                .padding(.leading)
                .padding(.trailing)
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    Button(action: {
                        cardsData.cards[cardIndex].liked.toggle()
                    }, label: {
                        cardsData.cards[cardIndex].liked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    })
                    .symbolEffect(.bounce, value: cardsData.cards[cardIndex].liked)
                    .foregroundStyle(cardsData.cards[cardIndex].liked ? .red : Color("DarkmodeSafeBlack"))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "text.bubble")
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    Spacer()
                    Button(action: {
                        cardsData.cards[cardIndex].bookMarked.toggle()
                    }, label: {
                        cardsData.cards[cardIndex].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                    })
                    .symbolEffect(.bounce, value: cardsData.cards[cardIndex].bookMarked)
                    .foregroundStyle(cardsData.cards[cardIndex].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
                }
                .foregroundStyle(Color("DarkmodeSafeBlack"))
                .font(.title2)
                .padding()
                
                HStack() {
                    VStack(alignment: .leading) {
                        Text(card.date)
                            .font(.caption2)
                            .fontWeight(.ultraLight)
                        HStack {
                            Text(profile.name)
                                .fontWeight(.bold)
                            Text(card.comment)
                        }
                    }
                    Spacer()
                }
                .padding(.leading)
                .padding(.trailing)
                
                HStack {
                    Text("착용제품")
                    Spacer()
                }
                .font(.footnote)
                .fontWeight(.ultraLight)
                .padding()
                
                ForEach(cardsData.cards[cardIndex].cloths.indices) {clothIndex in
                    HStack {
                        NavigationLink {
                            DetailClothView(cardIndex: cardIndex, clothIndex: clothIndex)
                        } label: {
                            ClothView(cloth: cardsData.cards[cardIndex].cloths[clothIndex])
                        }
                        .tint(.darkmodeSafeBlack)
                        
                        Button(action: {
                            cardsData.cards[cardIndex].cloths[clothIndex].bookMarked.toggle()
                        }, label: {
                            cardsData.cards[cardIndex].cloths[clothIndex].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                        })
                        .symbolEffect(.bounce, value: cardsData.cards[cardIndex].cloths[clothIndex].bookMarked)
                        .foregroundStyle(cardsData.cards[cardIndex].cloths[clothIndex].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
                    }
                }
                .environmentObject(cardsData)
            }
        }
    }
}

#Preview {
    DetailCardView(cardIndex: 0)
        .environmentObject(Cards())
}
