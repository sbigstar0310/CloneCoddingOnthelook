//
//  CardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct CardView: View {
    var image: [String]
    
    var body: some View {
            ZStack(alignment: .topTrailing) {
                Image(image[0])
                    .resizable()
                    .aspectRatio(0.8, contentMode: .fill)
                if image.count > 1 {
                    Image(systemName: "rectangle.fill.on.rectangle.fill")
                        .foregroundStyle(.white)
                        .padding(5)
                }
            }
    }
}

#Preview {
    CardView(image: ["card01", "card01-2"])
}
