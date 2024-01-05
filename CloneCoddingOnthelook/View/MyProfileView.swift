//
//  MyProfileView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct MyProfileView: View {
    var profile: Profile
    
    var body: some View {
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
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
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
            .padding()
        }
    }
}

#Preview {
    MyProfileView(profile: Profile(name: "sbigstar0332", image: "profileImage", height:"173", weight: "73", job: "대학생", follower: 23, following: 10))
}
