//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject private var dataModel: DataModel
    var cardIndex: Int
    
    var body: some View {
        let card = dataModel.cards[cardIndex]
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
                    
                    Button(action: {
                        dataModel.cards[cardIndex].profile.isFollowing.toggle()
                    }, label: {
                        dataModel.cards[cardIndex].profile.isFollowing ? Text("팔로우 취소") : Text("팔로잉")
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
                        dataModel.cards[cardIndex].liked.toggle()
                    }, label: {
                        dataModel.cards[cardIndex].liked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    })
                    .symbolEffect(.bounce, value: dataModel.cards[cardIndex].liked)
                    .foregroundStyle(dataModel.cards[cardIndex].liked ? .red : Color("DarkmodeSafeBlack"))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "text.bubble")
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    Spacer()
                    Button(action: {
                        dataModel.cards[cardIndex].bookMarked.toggle()
                    }, label: {
                        dataModel.cards[cardIndex].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                    })
                    .symbolEffect(.bounce, value: dataModel.cards[cardIndex].bookMarked)
                    .foregroundStyle(dataModel.cards[cardIndex].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
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
                
                ForEach(dataModel.cards[cardIndex].cloths.indices) {clothIndex in
                    HStack {
                        NavigationLink {
                            DetailClothView(cardIndex: cardIndex, clothIndex: clothIndex)
                        } label: {
                            ClothView(cloth: dataModel.cards[cardIndex].cloths[clothIndex])
                        }
                        .tint(.darkmodeSafeBlack)
                        
                        Button(action: {
                            dataModel.cards[cardIndex].cloths[clothIndex].bookMarked.toggle()
                        }, label: {
                            dataModel.cards[cardIndex].cloths[clothIndex].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                        })
                        .symbolEffect(.bounce, value: dataModel.cards[cardIndex].cloths[clothIndex].bookMarked)
                        .foregroundStyle(dataModel.cards[cardIndex].cloths[clothIndex].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
                    }
                }
                .environmentObject(dataModel)
            }
        }
    }
}

#Preview {
    DetailCardView(cardIndex: 0)
        .environmentObject(DataModel())
}
