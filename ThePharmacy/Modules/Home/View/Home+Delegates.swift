//
//  Home+Delegates.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import UIKit

// MARK:- NETWORK SCREEN

extension HomeController: NetworkScreenControllerDelegate {
    
    func didClickTypeAgain() {
        presenter.viewDidLoad()
    }
}

// MARK:- ALERT

extension HomeController: AlertWithThreeButtons {
    
    func didClickedAlertButton(_ btnNo: Int) {
        switch btnNo {
        case 1:
            if LOCAL.getLanguage() == Language.AR.rawValue {
                LOCAL.setLocale(.EN, .forceLeftToRight)
                RootRouter().resetApp()
            }
        case 2:
            if LOCAL.getLanguage() == Language.EN.rawValue {
                LOCAL.setLocale(.AR, .forceRightToLeft)
                RootRouter().resetApp()
            }
        default:
            break
        }
    }
}

// MARK:- SEE ALL

extension HomeController: SeeAllDelegate {
    
    func didCliecked(_ type: SectionCellType?) {
        switch type {
        case .Offers:
            break
        case .Categories:
            break
        default:
            break
        }
    }
}
