//
//  ZoomCardView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/22/24.
//

import SwiftUI

struct ZoomCardView: View {
    var image: String
    @State private var zoomScale = 1.0
    
    private var magnification: some Gesture {
        MagnifyGesture()
             .onChanged { value in
                 zoomScale += value.magnification - 1
                 if zoomScale <= 0.8 {
                     zoomScale = 0.8
                 }
                 if zoomScale >= 15 {
                     zoomScale = 15
                 }
             }
             .onEnded { value in
                 if zoomScale <= 1 {
                     zoomScale = 1
                 }
             }
     }
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .scaleEffect(zoomScale)
                .gesture(magnification)
            Spacer()
        }
    }
}

#Preview {
    ZoomCardView(image: "card01")
}
