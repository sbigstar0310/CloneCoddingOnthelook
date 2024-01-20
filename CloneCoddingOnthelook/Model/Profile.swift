//
//  Profile.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import Foundation

struct Profile: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var image: String
    var gender: String = "male"
    var height: String
    var weight: String
    var job: String
    var follower: Int = 0
    var following: Int = 0
    var isFollowing: Bool = false
}

var testProfiles: [Profile] = [
    Profile(name: "sbigstar0332", image: "profileImage", height: "173", weight: "73", job: "대학생"),
    Profile(name: "Jane", image: "profileImage", gender: "female", height: "161", weight: "61", job: "패션 스타일러", isFollowing: true),
    Profile(name: "Honel", image: "profileImage", gender: "male", height: "188", weight: "78", job: "금융업 종사자", isFollowing: true),
    Profile(name: "Alextina Gael", image: "profileImage", gender: "female", height: "168", weight: "58", job: "대학 교수", isFollowing: false),
    Profile(name: "김광석", image: "profileImage", gender: "male", height: "174", weight: "67", job: "카페 사장", isFollowing: true)
]
