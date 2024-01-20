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
    case like = "좋아요"
}

struct BookMarkView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    @State private var selectedPicker: tapInfo = .style
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("북마크")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                animate()
                SelectedBookMarkView(selectedPicker: selectedPicker)
                    .environmentObject(dataModel)
            }
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/4, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? .darkmodeSafeBlack : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.darkmodeSafeBlack)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "anyId", in: animation)
                    } else {
                        Color.clear.frame(height: 2)
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
    @EnvironmentObject private var dataModel: TestDataModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch selectedPicker {
            case .style:
                BookMarkStyleView()
            case .creator:
                BookMarkCreatorView()
            case .item:
                BookMarkItemView()
            case .like:
                BookMarkLikeView()
            }
        }
        .environmentObject(dataModel)
        
    }
}

#Preview {
    BookMarkView()
        .environmentObject(TestDataModel())
}
