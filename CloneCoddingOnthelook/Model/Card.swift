//
//  Card.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import Foundation

//struct Card: Identifiable {
//    var id: String = UUID().uuidString
//    var profile: Profile
//    var image: String
//    var comment: String
//    var cloths: [Cloth]
//    var date: String = "2001.01.01"
//    var bookMarked: Bool = false
//    var liked: Bool = false
//}

struct Card: Identifiable {
    var id: String = UUID().uuidString
    var profileId: String
    var image: String
    var comment: String
    var clothsId: [String]
    var date: String = "2001.01.01"
    var bookMarked: Bool = false
    var liked: Bool = false
}
