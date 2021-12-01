//
//  HomePresenter.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeView?
    var router: HomeRouterInterface!
    var interactor: HomeInteractorInterface!
    
    func viewDidLoad() {
        view?.showLoading()
        getCategories()
        getSliders()
        view?.reloadData()
    }
    
    func getCategories() {
        view?.group.enter()
        interactor.getCategories()
    }
    
    func getSliders() {
        view?.group.enter()
        interactor.getSliders()
    }
}

extension HomePresenter: HomeInteractorOutput {
        
    func didGetCategories(_ categories: [Category]) {
        view?.categories = categories
        view?.group.leave()
    }
    
    func didFailToGetCategories(_ error: APIError) {
        checkError(error)
        view?.group.leave()
    }
    
    func didGetSliders(_ sliders: [Slider]) {
        view?.sliders = sliders
        view?.group.leave()
    }
    
    func didFailToGetSliders(_ error: APIError) {
        checkError(error)
        view?.group.leave()
    }
    
    func checkError(_ error: APIError) {
        view?.group.notify(queue: .main) { [self] in
            view?.presentNetworkErrorScreen()
        }
    }
}
