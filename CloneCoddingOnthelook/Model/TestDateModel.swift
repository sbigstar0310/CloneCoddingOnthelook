//
//  Data.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/15/24.
//

import Foundation

class TestDataModel: ObservableObject {
    @Published var cards: [Card]
    @Published var profiles: [Profile]
    @Published var cloths: [Cloth]
    
    init() {
        self.profiles = [
            Profile(id: "01_sbigstar0332", name: "sbigstar0332", image: "profileImage", height: "173", weight: "73", job: "대학생"),
            Profile(id: "02_Jane", name: "Jane", image: "profileImage", gender: "female", height: "161", weight: "61", job: "패션 스타일러", isFollowing: true),
            Profile(id: "03_Honel", name: "Honel", image: "profileImage", gender: "male", height: "188", weight: "78", job: "금융업 종사자", isFollowing: true),
            Profile(id: "04_Alextina Gael", name: "Alextina Gael", image: "profileImage", gender: "female", height: "168", weight: "58", job: "대학 교수", isFollowing: false),
            Profile(id: "05_김광석",name: "김광석", image: "profileImage", gender: "male", height: "174", weight: "67", job: "카페 사장", isFollowing: true)
        ]
        
        self.cloths = [
            Cloth(id: "01", name: "루키 언스트럭쳐 볼캡 LA다저스", brand: "MLB", price: "36000", image: "nycCap", size: "FREE", url: "https://www.musinsa.com/app/goods/1214109"),
            Cloth(id: "02", name: "[3M 신슐레이트]오리지널 M-1965 피쉬테일 파카", brand: "LAFUDGESTORE", price: "148000", image: "clothImage", size: "M", url: "https://www.musinsa.com/app/goods/2064478"),
            Cloth(id: "03", name: "Nike x J.Crew Killshot 2 Lucid Green", brand: "NIKE", price: "63000", image: "shoose", url: "https://kream.co.kr/products/23500"),
            Cloth(id: "04", name: "남성 셰틀랜드 울 싱글 벤트 스포츠 재킷 - 네이비", brand: "THOM BROWNE", price: "1,081,000", image: "cloth01", size: "3", url: "https://www.musinsa.com/app/goods/2835447", bookMarked: true)
        ]
        self.cards = [
            .init(id: "card01", profileId: "01_sbigstar0332", image: "card01", comment: "This is comment", clothsId: ["01", "02", "03"], bookMarked: false),
            .init(id: "card02", profileId: "01_sbigstar0332", image: "card02", comment: "blabla", clothsId: ["04"], bookMarked: true, liked: true),
            .init(id: "card03", profileId: "02_Jane", image: "card03", comment: "blabla", clothsId: [], liked: true),
            .init(id: "card04", profileId: "03_Honel", image: "card04", comment: "blabla", clothsId: [], liked: true),
            .init(id: "card05", profileId: "04_Alextina Gael", image: "card05", comment: "blabla", clothsId: [], liked: true)
        ]
    }
    
    func getCard(withId cardId: String) -> Card? {
        if let index = cards.firstIndex(where: { $0.id == cardId }) {
            return cards[index]
        }
        return nil
    }
    
    func updateCard(withId cardId: String,
                    newComment: String? = nil,
                    newClothsId: [String]? = nil,
                    newBookMarked: Bool? = nil,
                    newLiked: Bool? = nil) {
        if let index = cards.firstIndex(where: { $0.id == cardId }) {
            if let newComment = newComment {
                cards[index].comment = newComment
            }
            if let newClothsId = newClothsId {
                cards[index].clothsId = newClothsId
            }
            if let newBookMarked = newBookMarked {
                cards[index].bookMarked = newBookMarked
            }
            if let newLiked = newLiked {
                cards[index].liked = newLiked
            }
        }
    }
    
    func getProfile(withId profileId: String) -> Profile? {
        if let index = profiles.firstIndex(where: { $0.id == profileId }) {
            return profiles[index]
        }
        return nil
    }
    
    func updateProfile(withId profileId: String,
                       newName: String? = nil,
                       newImage: String? = nil,
                       newGender: String? = nil,
                       newHeight: String? = nil,
                       newWeight: String? = nil,
                       newJob: String? = nil,
                       newFollower: Int? = nil,
                       newFollowing: Int? = nil,
                       newIsFollowing: Bool? = nil) {
        if let index = profiles.firstIndex(where: { $0.id == profileId }) {
            if let newName = newName {
                profiles[index].name = newName
            }
            if let newImage = newImage {
                profiles[index].image = newImage
            }
            if let newGender = newGender {
                profiles[index].gender = newGender
            }
            if let newHeight = newHeight {
                profiles[index].height = newHeight
            }
            if let newWeight = newWeight {
                profiles[index].weight = newWeight
            }
            if let newJob = newJob {
                profiles[index].job = newJob
            }
            if let newFollower = newFollower {
                profiles[index].follower = newFollower
            }
            if let newFollowing = newFollowing {
                profiles[index].following = newFollowing
            }
            if let newIsFollowing = newIsFollowing {
                profiles[index].isFollowing = newIsFollowing
            }
        }
    }
    
    func getCloth(withId clothId: String) -> Cloth? {
        if let index = cloths.firstIndex(where: { $0.id == clothId }) {
            return cloths[index]
        }
        return nil
    }
    
    func updateCloth(withId clothId: String,
                     newName: String? = nil,
                     newBrand: String? = nil,
                     newPrice: String? = nil,
                     newImage: String? = nil,
                     newSize: String? = nil,
                     newUrl: String? = nil,
                     newBookMarked: Bool? = nil) {
        
        if let index = cloths.firstIndex(where: { $0.id == clothId }) {
            if let newName = newName {
                cloths[index].name = newName
            }
            if let newBrand = newBrand {
                cloths[index].brand = newBrand
            }
            if let newPrice = newPrice {
                cloths[index].price = newPrice
            }
            if let newImage = newImage {
                cloths[index].image = newImage
            }
            if let newSize = newSize {
                cloths[index].size = newSize
            }
            if let newUrl = newUrl {
                cloths[index].url = newUrl
            }
            if let newBookMarked = newBookMarked {
                cloths[index].bookMarked = newBookMarked
            }
        }
    }
}
