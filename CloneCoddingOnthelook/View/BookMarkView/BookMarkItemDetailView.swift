//
//  BookMarkItemDetailView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/17/24.
//

import SwiftUI

struct BookMarkItemDetailView: View {
    @EnvironmentObject private var dataModel: TestDataModel

    var clothId: String

    var body: some View {
        let item = dataModel.getCloth(withId: clothId)!
        
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 30))
                .frame(width: 100)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(item.brand)
                    .fontWeight(.bold)
                Text(item.name)
                Text("₩\(item.price)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Button(action: {
                    dataModel.updateCloth(withId: item.id, newBookMarked: item.bookMarked ? false : true)
                    }, label: {
                        item.bookMarked ?
                        Image(systemName: "bookmark.fill") :
                        Image(systemName: "bookmark")
                })
                .foregroundStyle(item.bookMarked ? .yellow : Color("DarkmodeSafeBlack"))

                Spacer()
                
                NavigationLink {
                    DetailClothView(clothId: item.id)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 80, height: 40)
                            .background(.black)
                            .clipShape(.buttonBorder)
                            .tint(.darkmodeSafeBlack)
                        
                        Text("구매하기")
                            .fontWeight(.bold)
                            .foregroundStyle(.darkmodeSafeBlack)
                            .colorInvert()
                    }
                }
            }
            .padding(.trailing)
        }
        .frame(height: 100)
    }
}

#Preview {
    BookMarkItemDetailView(clothId: "04")
        .environmentObject(TestDataModel())
}
