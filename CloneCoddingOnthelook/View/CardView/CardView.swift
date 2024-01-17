//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct CardView: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(0.8, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 195, height: 240)
            .clipShape(Rectangle())
    }
}

#Preview {
    CardView(image: "card01")
}
