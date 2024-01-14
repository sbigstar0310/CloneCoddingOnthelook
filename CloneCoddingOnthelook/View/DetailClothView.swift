//
//  DetailClothView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/11/24.
//

import SwiftUI
import SafariServices

struct DetailClothView: View {
    @EnvironmentObject private var cardsData: Cards
    var cardIndex: Int
    var clothIndex: Int
    
    var body: some View {
        let cloth = cardsData.cards[cardIndex].cloths[clothIndex]
        
        ScrollView {
            LazyVStack(pinnedViews: [.sectionFooters]) {
                Section {
                    Image(cloth.image)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Text(cloth.brand)
                        Text(">")
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(Color("DarkmodeSafeBlack"))
                        })
                        
                        Button(action: {
                            cardsData.cards[cardIndex].cloths[clothIndex].bookMarked.toggle()
                        }, label: {
                            cardsData.cards[cardIndex].cloths[clothIndex].bookMarked ? Image(systemName: "bookmark.fill") : Image(systemName: "bookmark")
                        })
                        .symbolEffect(.bounce, value: cardsData.cards[cardIndex].cloths[clothIndex].bookMarked)
                        .foregroundStyle(cardsData.cards[cardIndex].cloths[clothIndex].bookMarked ? .yellow : Color("DarkmodeSafeBlack"))
                    }
                    .fontDesign(.rounded)
                    .font(.headline)
                    .fontWeight(.ultraLight)
                    .padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(cloth.name)
                            Text("₩\(cloth.price)")
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                    .padding(.leading)
                    
                } footer: {
                    BottomBarView(cloth: cloth)
                }

            }
        }
    }
}

struct BottomBarView: View {
    var cloth = Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE")
    
    var body: some View {
        VStack {
            NavigationLink {
                SafariView(url: URL(string: cloth.url)!)
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .background(.black)
                        .clipShape(.buttonBorder)
                        .tint(.darkmodeSafeBlack)
                    
                    Text("웹사이트에서 보기")
                        .fontWeight(.bold)
                        .foregroundStyle(.darkmodeSafeBlack)
                        .colorInvert()
                }
            }
            
            Text(cloth.url)
                .font(.caption)
                .fontWeight(.ultraLight)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

#Preview {
    DetailClothView(cardIndex: 0, clothIndex: 0)
        .environmentObject(Cards())
}
