//
//  Api.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

let API = Api(.development)

enum APIConfigurations: String {
    
    case development = "debug"
    case stage = "stage"
    case release = "release"
}

final class Api {
    
    let config: APIConfigurations
    
    var BASE_URL: String {
        switch config {
        case .development:
            return "http://40.127.194.127:5656/Pharmacy/"
        case .stage:
            return "http://40.127.194.127:5656/Pharmacy/"
        case .release:
            return "http://40.127.194.127:5656/Pharmacy/"
        }
    }
    
    init(_ config: APIConfigurations) {
        self.config = config
    }
        
    // MARK:- CATEGORIES
    
    let SERVICE_HOME_CATEGORIES = "GetMedicationsGroups"
    
    // MARK:- OFFERS
    
    let SERVICE_HOME_OFFERS = "Get_Pharmacy_Promotions_Category"
}


// MARK:- IMAGE PATh
extension Api {
    
    func getImagePath(_ id: Int) -> String {
        return "https://youmeda.com/Uploads/PharmactPromoCategories/\(id).png"
    }
}
