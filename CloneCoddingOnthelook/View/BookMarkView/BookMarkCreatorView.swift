//
//  BookMarkCreatorView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/20/24.
//

import SwiftUI

struct BookMarkCreatorView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    var gridItems = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        let profileFilterd = dataModel.profiles.filter { profile in
            profile.isFollowing
        }
        ScrollView {
            HStack() {
                Text("팔로우 리스트")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            
            LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                ForEach(profileFilterd) { profile in
                    BookMarkCreatorDetailView(profile: profile)
                    
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
}

#Preview {
    BookMarkCreatorView()
        .environmentObject(TestDataModel())
}
