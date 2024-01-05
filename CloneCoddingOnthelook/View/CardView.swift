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
            .aspectRatio(contentMode: .fill)
            .frame(width: 195, height: 240)
            .clipped()
    }
}

#Preview {
    CardView(image: "card01")
}
