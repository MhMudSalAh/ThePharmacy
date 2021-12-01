//
//  APIResponse.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

enum APIResponse<T> {
    
    case success(T)
    case failure(APIError)
    case complete
}
