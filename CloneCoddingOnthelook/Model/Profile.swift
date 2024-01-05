//
//  Profile.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import Foundation

struct Profile: Identifiable {
    var id: UUID = .init()
    var name: String
    var image: String
    var gender: String = "male"
    var height: String
    var weight: String
    var job: String
    var follower: Int = 0
    var following: Int = 0
}
