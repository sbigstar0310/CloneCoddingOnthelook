//
//  testCardImageView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/23/24.
//

import SwiftUI

struct testCardImageView: View {
    var cardImage = ["card01", "card01-2"]
    @State private var scrollPosition: CGPoint = .zero
    @State private var scrollIndex: Int = 0
    @State private var showHeart = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(cardImage, id:\.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .containerRelativeFrame(.horizontal, count: cardImage.count, span: cardImage.count, spacing: 0)
                            .overlay(alignment: .topTrailing) {
                                NavigationLink {
                                    ZoomCardView(image: image)
                                } label: {
                                    Image(systemName: "square.arrowtriangle.4.outward")
                                        .padding(.trailing, 10)
                                        .padding(.top, 12)
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            .id(image)
                    }
                }
                .frame(height: 500)
                .border(Color.black)
                .background(GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
                })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    self.scrollPosition = value
                    scrollIndex = Int((abs(value.x) + 200) / 400)
                    print(scrollIndex)
                }
            }
            .coordinateSpace(name: "scroll")
            .navigationTitle("Scroll offset: \(scrollPosition.x)")
            .navigationBarTitleDisplayMode(.inline)
            .scrollTargetBehavior(.paging)
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

#Preview {
    testCardImageView()
}
