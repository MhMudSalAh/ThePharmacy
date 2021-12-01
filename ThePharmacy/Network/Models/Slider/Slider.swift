//
//  Slider.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import Foundation

class Slider: NSObject, Codable {
    
    var id: Int?
    var image: String?
    
    override init() {
        super.init()
    }
}

extension Slider {
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case image
    }
}
