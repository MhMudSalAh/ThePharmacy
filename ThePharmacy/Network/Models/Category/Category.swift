//
//  Category.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

class Category: NSObject, Codable {
    
    var id: Int?
    var titleEN: String?
    var titleAR: String?
    var image: String?
    
    override init() {
        super.init()
    }
}

extension Category {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case titleEN = "EnglishName"
        case titleAR = "ArabicName"
        case image = "CatImage"
    }
}
