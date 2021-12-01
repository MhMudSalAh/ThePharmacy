//
//  APIHeader.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

enum APIHeader: String {
    
    case accept = "Accept"
    case contentType = "Content-Type"
    case contentLenght = "Content-Length"
    case mutliPart = "multipart/form-data; boundary="
    case locale = "locale"
    case deviceOS = "deviceOs"
    case deviceId = "deviceId"
    case applicationVersion = "applicationVersion"
    case buildNumber = "buildNumber"
    case authorization = "Authorization"
    case applicationJson = "application/json"
    case ios = "iOS"
    case cityId = "city_id"
}
