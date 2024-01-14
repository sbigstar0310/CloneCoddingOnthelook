//
//  ClothView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import SwiftUI

struct ClothView: View {
    var cloth = Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M")
    
    var body: some View {
        HStack {
            Image(cloth.image)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
            
            Spacer()
            
            VStack {
                Text(cloth.brand)
                    .fontWeight(.bold)
                    .font(.footnote)
                Text(cloth.name)
                    .fontWeight(.ultraLight)
                    .font(.footnote)
                Text("₩\(cloth.price) \(cloth.size)사이즈")
                    .font(.footnote)
            }
            
            Spacer()
        }
        .frame(width: 350, height: 70)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 25, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    ClothView()
}
