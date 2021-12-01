//
//  HomeRouter.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class HomeRouter: HomeRouterInterface {
    
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view: HomeController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeController") as! HomeController
            
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
