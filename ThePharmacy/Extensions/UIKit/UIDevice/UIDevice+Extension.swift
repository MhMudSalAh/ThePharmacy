//
//  UIDevice+Extension.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

extension UIDevice {

    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}

