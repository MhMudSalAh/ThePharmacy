//
//  UINavigationController+Extension.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

extension UINavigationController {
    
    func setup() {
        navigationBar.tintColor = .secondary
        navigationBar.barTintColor = .primary
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        let font = UIFont.semiBoldFont(ofSize: 18)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondary, NSAttributedString.Key.font: font]
        navigationBar.isTranslucent = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primary
        appearance.shadowColor = .clear
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondary, NSAttributedString.Key.font: font]
        navigationBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationBar.scrollEdgeAppearance = appearance
         }
    }
}
