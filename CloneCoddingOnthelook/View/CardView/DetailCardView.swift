//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    @State private var showHeart = false
    var cardId: String
    
    var body: some View {
        let card: Card = dataModel.getCard(withId: cardId)!
        let profile = dataModel.getProfile(withId: card.profileId)!
        
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
                        dataModel.getProfile(withId: profile.id)!.isFollowing ? dataModel.updateProfile(withId: profile.id, newIsFollowing: false) :  dataModel.updateProfile(withId: profile.id, newIsFollowing: true)
                    }, label: {
                        dataModel.getProfile(withId: profile.id)!.isFollowing ? Text("팔로우 취소") : Text("팔로잉")
                    })
                    .buttonStyle(.bordered)
                }
                .padding(.leading)
                .padding(.trailing)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(card.image, id:\.self) { image in
                            ZStack {
                                Image(image)
                                    .resizable()
                                    .overlay(alignment: .topTrailing, content: {
                                        NavigationLink {
                                            ZoomCardView(image: image)
                                        } label: {
                                            Image(systemName: "square.arrowtriangle.4.outward")
                                                .padding()
                                                .foregroundStyle(.white)
                                        }
                                    })
                                    .scaledToFit()
                                    .containerRelativeFrame(.horizontal, count: card.image.count, span: card.image.count, spacing: 0)
                                    .onTapGesture(count: 2, perform: {
                                        dataModel.updateCard(withId: card.id, newLiked: true)
                                        withAnimation(.easeInOut) {
                                            showHeart = true
                                        }
                                    })
                                
                                if showHeart {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundStyle(.red)
                                        .frame(width: 100, height: 100)
                                        .onAppear(perform: {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                showHeart = false
                                            })
                                        })
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                
                HStack {
                    Button(action: {
                        dataModel.getCard(withId: card.id)!.liked ? dataModel.updateCard(withId: card.id, newLiked: false) :  dataModel.updateCard(withId: card.id, newLiked: true)
                    }, label: {
                        dataModel.getCard(withId: card.id)!.liked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                    })
                    .symbolEffect(.bounce, value: dataModel.getCard(withId: card.id)!.liked)
                    .foregroundStyle(dataModel.getCard(withId: card.id)!.liked ? .red : Color("DarkmodeSafeBlack"))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "text.bubble")
                    })
                    ShareLink(item: Image(card.image[0]), preview: SharePreview("@\(profile.name)님의 스타일", image: Image(card.image[0]))) {
                        Label("", systemImage: "square.and.arrow.up")
                    }
                    Spacer()
                    Button(action: {
                        dataModel.getCard(withId: card.id)!.bookMarked ? dataModel.updateCard(withId: card.id, newBookMarked: false) :  dataModel.updateCard(withId: card.id, newBookMarked: true)
                    }, label: {
                        dataModel.getCard(withId: card.id)!.bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                    })
                    .symbolEffect(.bounce, value: dataModel.getCard(withId: card.id)!.bookMarked)
                    .foregroundStyle(dataModel.getCard(withId: card.id)!.bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
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
                
                ForEach(card.clothsId, id: \.self) { (clothId: String) in
                    HStack {
                        NavigationLink {
                            DetailClothView(clothId: clothId)
                        } label: {
                            ClothView(cloth: dataModel.getCloth(withId: clothId)!)
                        }
                        .tint(.darkmodeSafeBlack)
                        
                        Button(action: {
                            dataModel.getCloth(withId: clothId)!.bookMarked ?
                            dataModel.updateCloth(withId: clothId, newBookMarked: false) :  dataModel.updateCloth(withId: clothId, newBookMarked: true)
                        }, label: {
                            dataModel.getCloth(withId: clothId)!.bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                        })
                        .symbolEffect(.bounce, value: dataModel.getCloth(withId: clothId)!.bookMarked)
                        .foregroundStyle(dataModel.getCloth(withId: clothId)!.bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
                    }
                }
                .environmentObject(dataModel)
            }
        }
    }
}

#Preview {
    DetailCardView(cardId: "card01")
        .environmentObject(TestDataModel())
}
