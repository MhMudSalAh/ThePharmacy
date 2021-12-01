//
//  HomeInteractor.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class HomeInteractor: HomeInteractorInterface {
    
    var output: HomeInteractorOutput!
    
    func getCategories() {
        CATEGORY.get() { (response) in
            switch response {
            case let .onSuccess(categories):
                self.output?.didGetCategories(categories)
                break
            case let .onFailure(error):
                self.output?.didFailToGetCategories(error)
                break
            case .onCompleted:
                break
            }
        }
    }
    
    func getSliders() {
        OFFER.get() { (response) in
            switch response {
            case let .onSuccess(sliders):
                self.output?.didGetSliders(sliders)
                break
            case let .onFailure(error):
                self.output?.didFailToGetSliders(error)
                break
            case .onCompleted:
                break
            }
        }
    }
}
