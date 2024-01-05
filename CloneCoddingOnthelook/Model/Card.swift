//
//  Card.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import Foundation

struct Card: Identifiable {
    var id: UUID = .init()
    var profile: Profile
    var image: String
    var comment: String
    var cloths: [Cloth]
    var date: String = "2001.01.01"
    var bookMarked: Bool = false
    var liked: Bool = false
}

class Cards: ObservableObject {
    @Published var cards: [Card] = [
        .init(profile: myProfile, image: "card01", comment: "This is comment", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose")], bookMarked: false),
        .init(profile: profile02, image: "card02", comment: "blabla", cloths: []),
        .init(profile: profile02, image: "card03", comment: "blabla", cloths: []),
        .init(profile: myProfile, image: "card04", comment: "blabla", cloths: []),
        .init(profile: myProfile, image: "card05", comment: "blabla", cloths: [])
    ]
}

var myProfile = Profile(name: "sbigstar0332", image: "profileImage", height: "173", weight: "73", job: "대학생")
var profile02 = Profile(name: "JJAANNGGJJUU", image: "profileImage", gender: "female", height: "161", weight: "61", job: "대학생")
