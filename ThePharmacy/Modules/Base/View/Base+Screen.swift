//
//  Base+Screen.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

// MARK:- Network Screen

extension BaseController {
    
    func showNetworkErrorScreen(_ delegate: NetworkScreenControllerDelegate?, _ view: UIView) {
        isNetworkScreenPresented = true
        NETWORKSCREEN.delegate = delegate
        NETWORKSCREEN.showAsSubView(view)
    }
    
    func closeNetworkErrorScreen() {
        isNetworkScreenPresented = false
        if NETWORKSCREEN.isPresented {
            NETWORKSCREEN.close()
        }
    }
}
