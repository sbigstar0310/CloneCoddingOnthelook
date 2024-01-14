//
//  HomeView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var cardsData: Cards
    @State private var toggleMale = false
    @State private var toggleFemale = false
    @State private var heightLowerBound: Double = 145
    @State private var heightUpperBound: Double = 195
    
    var gridItems = [GridItem(), GridItem()]
    
    func matchHeight(card: Card) -> Bool {
        return Int(heightLowerBound) <=
        Int(card.profile.height)! && Int(card.profile.height)! <= Int(heightUpperBound)
    }
    
    func matchGender(card: Card) -> Bool {
        if toggleMale && toggleFemale {
            // 남자 또는 여자일 경우 모든 카드 반환
            return true
        } else if toggleMale {
            // 남자일 경우 male인 카드만 반환
            return  card.profile.gender == "male"
        } else if toggleFemale {
            // 여자일 경우 female인 카드만 반환
            return card.profile.gender == "female"
        } else {
            // 아무 버튼도 클릭되지 않았을 경우 모든 카드 반환
            return true
        }
    }
    
    func match(card: Card) -> Bool {
        return matchHeight(card: card) && matchGender(card: card)
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Onthelook")
                    .bold()
                    .font(.title)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bell")
                        .tint(.black)
                        .font(.title2)
                })
            }
            .padding()
            
            // Filter Bar
            HStack {
                NavigationLink(destination: FilterDetailView(low: $heightLowerBound, up: $heightUpperBound, toggleMale: $toggleMale, toggleFemale: $toggleFemale)) {
                    Label("키", systemImage: "slider.horizontal.3")
                }
                .buttonStyle(.bordered)
                
                Button("남") {
                    toggleMale.toggle()
                }
                .background(toggleMale ? Color("lightBlue") : Color(uiColor: .systemGray6))
                .clipShape(.buttonBorder)
                .buttonStyle(.bordered)
                
                Button("여") {
                    toggleFemale.toggle()
                }
                .background(toggleFemale ? Color("lightBlue") : Color(uiColor: .systemGray6))
                .clipShape(.buttonBorder)
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding(.leading, 15)
            
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(cardsData.cards.indices, id: \.self) { cardIndex in
                        if match(card: cardsData.cards[cardIndex]) {
                            NavigationLink {
                                DetailCardView(cardIndex: cardIndex)
                            } label: {
                                CardView(image: cardsData.cards[cardIndex].image)
                            }
                        }
                    }
                    .environmentObject(cardsData)
                }
            }
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(Cards())
}
