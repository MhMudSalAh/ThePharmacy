//
//  CategoryService.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import Foundation

extension Api {
    
    enum Categories: ServiceProtocol {
        
        case get
        
        var path: String {
            switch self {
            case .get:
                return API.SERVICE_HOME_CATEGORIES
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .get:
                return .GET
            }
        }
        
        var parameters: [String : Any]? {
            switch self {
            case .get:
                return ["GroupCode": ""]
            }
        }
        
        var headers: Headers? {
            switch self {
            case .get:
                return nil
            }
        }
        
        var body: Any? {
            switch self {
            case .get:
                return nil
            }
        }
    }
}
