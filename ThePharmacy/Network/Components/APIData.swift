//
//  APIData.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

struct APIData<T: Decodable>: Decodable {
    
    var status: Status?
    var errors: Errors?
    var Data: T?
    var Success: Bool?
    var Code: Int?
}
