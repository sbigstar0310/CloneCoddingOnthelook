//
//  ContentView.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var dataModel: TestDataModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label( "홈", systemImage: "house")
                }
            BookMarkView()
                .tabItem { Label( "북마크", systemImage: "bookmark")
                }
            MyProfileView(profile: dataModel.profiles[0])
                .tabItem { Label( "My", systemImage: "person")
                }
        }
        .environmentObject(dataModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(TestDataModel())
}
