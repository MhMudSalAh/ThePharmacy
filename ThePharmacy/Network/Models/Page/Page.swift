//
//  Page.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

class Page<T: Codable>: NSObject, Codable {
    
    var data: T?
    var current: Int?
    var last: Int?
    
    override init() {
        super.init()
    }
}

extension Page {
    
    enum CodingKeys: String, CodingKey {
        
        case data
        case current
        case last
    }
}
