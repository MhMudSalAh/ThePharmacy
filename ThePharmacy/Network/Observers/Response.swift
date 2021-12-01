//
//  Response.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

enum Response<T> {

    case onSuccess(T)
    case onFailure(APIError)
    case onCompleted
}
