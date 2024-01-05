//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject private var cards: Cards
    var index: Int
    
    var body: some View {
        let card = cards.cards[index]
        let profile = card.profile
        
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
                    cards.cards[index].liked.toggle()
                }, label: {
                    cards.cards[index].liked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                })
                .symbolEffect(.bounce, value: cards.cards[index].liked)
                .foregroundStyle(cards.cards[index].liked ? .red : Color("DarkmodeSafeBlack"))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "text.bubble")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "square.and.arrow.up")
                })
                Spacer()
                Button(action: {
                    cards.cards[index].bookMarked.toggle()
                }, label: {
                    cards.cards[index].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                })
                .symbolEffect(.bounce, value: cards.cards[index].bookMarked)
                .foregroundStyle(cards.cards[index].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
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
            
            ForEach(card.cloths) {cloth in
                ClothView(cloth: cloth)
            }
        }
    }
}

#Preview {
    DetailCardView(index: 0)
        .environmentObject(Cards())
}
