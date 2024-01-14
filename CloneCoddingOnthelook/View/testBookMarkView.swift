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
}

struct testBookMarkView: View {

    @State private var selectedPicker: tapInfo = .style
    @Namespace private var animation
    
    var body: some View {
        VStack {
            animate()
            SelectedBookMarkView(selectedPicker: selectedPicker)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/3, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : .gray)

                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "anyId", in: animation)
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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch selectedPicker {
            case .style:
                BookMarkView()
                    .environmentObject(Cards())
            case .creator:
                CreatorView()
            case .item:
                ItemView()
            }
        }
    }
}

struct CreatorView: View {
    var body: some View {
        Text("크리에이터 뷰")
    }
}

struct ItemView: View {
    var body: some View {
        Text("아이템 뷰")
    }
}

#Preview {
    testBookMarkView()
}
