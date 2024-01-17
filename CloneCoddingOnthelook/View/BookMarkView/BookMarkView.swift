//
//  testBookMarkView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/14/24.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case style = "스타일"
    case creator = "크리에이터"
    case item = "아이템"
    case like = "좋아요"
}

struct BookMarkView: View {
    @EnvironmentObject private var dataModel: DataModel
    @State private var selectedPicker: tapInfo = .style
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("북마크")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                animate()
                SelectedBookMarkView(selectedPicker: selectedPicker)
                    .environmentObject(dataModel)
            }
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/4, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? .darkmodeSafeBlack : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.darkmodeSafeBlack)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "anyId", in: animation)
                    } else {
                        Color.clear.frame(height: 2)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct SelectedBookMarkView : View {
    var selectedPicker : tapInfo
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch selectedPicker {
            case .style:
                BookMarkStyleView()
            case .creator:
                BookMarkCreatorView()
            case .item:
                BookMarkItemView()
            case .like:
                BookMarkLikeView()
            }
        }
        .environmentObject(dataModel)
        
    }
}

struct BookMarkCreatorView: View {
    @EnvironmentObject private var dataModel: DataModel
    var gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                ForEach(dataModel.profiles) { profile in
                    if profile.isFollowing {
                        BookMarkCreatorDetailView(profile: profile)
                    }
                }
            }
        }
    }
}

struct BookMarkItemView: View {
    @EnvironmentObject private var dataModel: DataModel
    var body: some View {
        
        ForEach(dataModel.cards) {card in
            HStack {
                Image(card.profile.image)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                Text(card.profile.name)
                    
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            
            ForEach(card.cloths) {cloth in
                BookMarkItemDetailView(item: cloth)
                Divider()
            }
        }
    }
}

struct BookMarkLikeView: View {
    @EnvironmentObject private var dataModel: DataModel
    var gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                    ForEach(dataModel.cards.indices, id: \.self) { cardIndex in
                        if dataModel.cards[cardIndex].liked {
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
    BookMarkView()
        .environmentObject(DataModel())
}
