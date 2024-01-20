//
//  MyProfileView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct MyProfileView: View {
    var profile: Profile
    var gridItems = [GridItem(), GridItem()]
    @EnvironmentObject private var dataModel: TestDataModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("My")
                        .fontWeight(.bold)
                        .font(.title)
                    Spacer()
                    
                }
                .padding()
                
                HStack {
                    Image(profile.image)
                        .resizable()
                        .aspectRatio(0.8, contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading) {
                        Text(profile.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        HStack {
                            Text("팔로워")
                            Text("\(profile.follower)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("•")
                                .fontWeight(.ultraLight)
                            Text("팔로잉")
                            Text("\(profile.following)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.leading)
                    
                ScrollView {
                    LazyVGrid(columns: gridItems, alignment: .center, spacing: 5) {
                        ForEach(dataModel.cards) { card in
                            if dataModel.getProfile(withId: card.profileId)!.id == profile.id {
                                NavigationLink {
                                    DetailCardView(cardId: card.id)
                                } label: {
                                    CardView(image: card.image)
                                }
                            }
                        }
                        .environmentObject(dataModel)
                    }
                }
            }
        }
    }
}

#Preview {
    MyProfileView(profile: testProfiles[0])
        .environmentObject(TestDataModel())
}
