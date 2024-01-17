//
//  Data.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/15/24.
//

import Foundation

class DataModel: ObservableObject {
    @Published var cards: [Card]
    @Published var profiles: [Profile]
    
    init() {
        self.cards = [
            .init(profile: testProfiles[0], image: "card01", comment: "This is comment", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500")], bookMarked: false),
            .init(profile: testProfiles[1], image: "card02", comment: "blabla", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500")], bookMarked: true, liked: true),
            .init(profile: testProfiles[2], image: "card03", comment: "blabla", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500")], liked: true),
            .init(profile: testProfiles[3], image: "card04", comment: "blabla", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500")], liked: true),
            .init(profile: testProfiles[4], image: "card05", comment: "blabla", cloths: [Cloth(name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"), Cloth(name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"), Cloth(name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500")], liked: true)
        ]
        self.profiles = [
            Profile(name: "sbigstar0332", image: "profileImage", height: "173", weight: "73", job: "대학생"),
            Profile(name: "Jane", image: "profileImage", gender: "female", height: "161", weight: "61", job: "패션 스타일러", isFollowing: true),
            Profile(name: "Honel", image: "profileImage", gender: "male", height: "188", weight: "78", job: "금융업 종사자", isFollowing: true),
            Profile(name: "Alextina Gael", image: "profileImage", gender: "female", height: "168", weight: "58", job: "대학 교수", isFollowing: false),
            Profile(name: "김광석", image: "profileImage", gender: "male", height: "174", weight: "67", job: "카페 사장", isFollowing: true)
        ]
    }
}
