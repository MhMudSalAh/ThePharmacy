//
//  HomeContract.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

protocol HomeView: AnyObject {
    var presenter: HomePresenterInterface! { get set }
    var group: DispatchGroup { get set }
    var categories: [Category] { get set}
    var sliders: [Slider] { get set}
    
    func showLoading()
    func hideLoading()
    func reloadData()
    
    func presentNetworkErrorScreen()
    func hideNetworkErrorScreen()
}

protocol HomePresenterInterface: AnyObject {
    var view: HomeView? { get set }
    var router: HomeRouterInterface! { get set }
    var interactor: HomeInteractorInterface! { get set }
    
    func viewDidLoad()
    func getCategories()
    func getSliders()
}

protocol HomeInteractorInterface: AnyObject {
    var output: HomeInteractorOutput! { get set }
    
    func getCategories()
    func getSliders()
}

protocol HomeInteractorOutput: AnyObject {
    
    func didGetCategories(_ categories: [Category])
    func didFailToGetCategories(_ error: APIError)
    
    func didGetSliders(_ sliders: [Slider])
    func didFailToGetSliders(_ error: APIError)
}

protocol HomeRouterInterface: AnyObject {
    var viewController: UIViewController? { get set }
        
    static func assembleModule() -> UIViewController
}
