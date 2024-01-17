//
//  BookMarkItemDetailView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/17/24.
//

import SwiftUI

struct BookMarkItemDetailView: View {
    var item: Cloth = Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109")
    
    var body: some View {
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
                Image(systemName: "bookmark.fill")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("구매하기")
                })
                .buttonStyle(.borderedProminent)
                
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    BookMarkItemDetailView()
}
