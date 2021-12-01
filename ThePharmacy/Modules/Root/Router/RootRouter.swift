//
//  RootRouter.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class RootRouter: RootRouterInterface {
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = SplashRouter.assembleModule()
    }
    
    func resetApp() {
        let vc = SplashRouter.assembleModule()
        rootVC(vc)
    }
    
    func relaunchApp() {
        let vc = SplashRouter.assembleModule()
        rootVC(vc)
    }
    
    func rootVC(_ vc: UIViewController) {
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
    }
}
