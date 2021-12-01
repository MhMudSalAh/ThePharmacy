//
//  OffersRepository.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import UIKit

let OFFER = OffersRepository.shared

class OffersRepository: Repo {
    
    static let shared = OffersRepository()
    
    func get(_ completion: @escaping (Response<[Slider]>) -> ()) {
        provider.request(type: [Slider].self, service: Api.Offers.get) { response in
            switch response {
            case let .success(sliders):
                completion(.onSuccess(sliders))
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
