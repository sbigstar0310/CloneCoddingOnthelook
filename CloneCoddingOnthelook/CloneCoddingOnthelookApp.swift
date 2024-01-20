//
//  CloneCoddingOnthelookApp.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

@main
struct CloneCoddingOnthelookApp: App {
    @StateObject private var dataModel = TestDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
