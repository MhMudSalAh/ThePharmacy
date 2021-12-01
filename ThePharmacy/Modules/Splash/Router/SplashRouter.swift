//
//  SplashRouter.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class SplashRouter: SplashRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentHome() {
        let vc = HomeRouter.assembleModule()
        viewController?.navigationController?.pushViewController(vc, animated: false)
    }
    
    static func assembleModule() -> UIViewController {
        let view: SplashController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashController") as! SplashController
        
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        
        let navigation = NavController(rootViewController: view)
        navigation.setup()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return navigation
    }
}
