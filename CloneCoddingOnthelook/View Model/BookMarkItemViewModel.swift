//
//  BookMarkItemViewModel.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 1/18/24.
//

import Foundation

class BookMarkItemViewModel {
    var dataModel: TestDataModel
    
    init(dataModel: TestDataModel) {
        self.dataModel = dataModel
    }
    
    func DO() -> [Profile: [Cloth]] {
        var VM: [Profile: [Cloth]] = [:]
        
        let profileSet = dataModel.profiles.sorted(by: { p1, p2 in
            p1.name < p2.name
        })
        for profile in profileSet {
            VM[profile] = []
        }
        
        for card in dataModel.cards {
            for clothId in card.clothsId {
                let cloth = dataModel.getCloth(withId: clothId)!
                let profile = dataModel.getProfile(withId: card.profileId)!
                if !VM[profile]!.contains(cloth) && cloth.bookMarked {
                    VM[profile]!.append(cloth)
                }
            }
        }
        
        return VM
    }
}
