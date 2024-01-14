//
//  Cloth.swift
//  CloneCoddingOnthelook
//
//  Created by 성대규 on 12/26/23.
//

import Foundation

struct Cloth: Identifiable, Hashable {
    var id: UUID = .init()
    var name: String
    var brand: String
    var price: String
    var image: String
    var size: String = "FREE"
    var url: String = "https://www.musinsa.com/app/"
    var bookMarked: Bool = false
}
