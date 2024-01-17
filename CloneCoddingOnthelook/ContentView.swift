//
//  ContentView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataModel: DataModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label( "홈", systemImage: "house")
                }
            BookMarkView()
                .tabItem { Label( "북마크", systemImage: "bookmark")
                }
            MyProfileView(profile: Profile(name: "sbigstar0332", image: "profileImage", height:"173", weight: "73", job: "대학생"))
                .tabItem { Label( "My", systemImage: "person")
                }
        }
        .environmentObject(dataModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(DataModel())
}
