//
//  CloneCoddingOnthelookApp.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/24/23.
//

import SwiftUI

@main
struct CloneCoddingOnthelookApp: App {
    @StateObject private var cards = Cards()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cards)
        }
    }
}
