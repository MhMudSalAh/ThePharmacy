//
//  CategoryRepository.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import UIKit

let CATEGORY = CategoriesRepository.shared

class CategoriesRepository: Repo {
    
    static let shared = CategoriesRepository()
    
    func get(_ completion: @escaping (Response<[Category]>) -> ()) {
        provider.request(type: [Category].self, service: Api.Categories.get) { response in
            switch response {
            case let .success(categories):
                completion(.onSuccess(categories))
                break
            case let .failure(error):
                completion(.onFailure(error))
                break
            case .complete:
                completion(.onCompleted)
                break
            }
        }
    }
}
