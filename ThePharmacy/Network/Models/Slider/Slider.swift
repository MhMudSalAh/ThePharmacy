//
//  Slider.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import Foundation

class Slider: NSObject, Codable {
    
    var id: Int?
    var titleEN: String?
    var titleAR: String?
    
    override init() {
        super.init()
    }
    
    func imageURL() -> String? {
        if let id = id { return API.getImagePath(id) }
        return nil
    }
}

extension Slider {
    
    enum CodingKeys: String, CodingKey {
        
        case id = "Id"
        case titleEN = "EnglishName"
        case titleAR = "ArabicName"
    }
}
