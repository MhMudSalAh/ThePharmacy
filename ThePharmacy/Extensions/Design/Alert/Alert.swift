//
//  Alert.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 01/12/2021.
//

import UIKit

let ALERT = Alert.shared

protocol AlertWithTextFieldDelegate {
    func didClickedAlertDefault(_ text: String)
    func didClickedAlertCancel()
    func alertEmptyTextField()
}

protocol AlertWithThreeButtons {
    func didClickedAlertButton(_ btnNo: Int)
}

protocol AlertWithTwoButtons {
    func didClickedAlertButton(_ btnNo: Int)
}

class Alert {
    
    static let shared = Alert()
    var alert: UIAlertController = UIAlertController()
    
    func withTextField(vc: UIViewController, title: String? = nil, message: String? = nil, placeholder: String, btnTitle: String, delegate: AlertWithTextFieldDelegate) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
        }
        
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: { [weak alert] (_) in
            
            let textField = alert?.textFields![0]
            
            if let text = textField?.text, !(textField?.text?.isEmpty ?? true) {
                alert?.dismiss(animated: true, completion: nil)
                delegate.didClickedAlertDefault(text)
            } else {
                delegate.alertEmptyTextField()
            }
        }))
        
        alert.addAction(UIAlertAction(title: localizedText("cancel"), style: .cancel, handler: nil))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func withThreeButtons(vc: UIViewController, title: String? = nil, message: String? = nil, btnOneTitle: String, btnTwoTitle: String, btnThreeTitle: String, delegate: AlertWithThreeButtons) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: btnOneTitle, style: .default, handler: { alert in
            delegate.didClickedAlertButton(1)
        }))
        
        alert.addAction(UIAlertAction(title: btnTwoTitle, style: .default, handler: { alert in
            delegate.didClickedAlertButton(2)
        }))
        
        alert.addAction(UIAlertAction(title: btnThreeTitle, style: .default, handler: { alert in
            delegate.didClickedAlertButton(3)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func withTwoButtons(vc: UIViewController, title: String? = nil, message: String? = nil, btnOneTitle: String, btnTwoTitle: String, delegate: AlertWithTwoButtons) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: btnOneTitle, style: .default, handler: { alert in
            delegate.didClickedAlertButton(1)
        }))
        
        alert.addAction(UIAlertAction(title: btnTwoTitle, style: .default, handler: { alert in
            delegate.didClickedAlertButton(2)
        }))
        
        vc.present(alert, animated: true, completion: nil)
    }
}

// MARK: Functions Usage
extension Alert {
        
    func atToFavourite(vc: UIViewController, delegate: AlertWithThreeButtons) {
        ALERT.withThreeButtons(vc: vc, title: localizedText("change_language_message"), message: nil, btnOneTitle: localizedText("english"), btnTwoTitle: localizedText("arabic"), btnThreeTitle: localizedText("cancel"), delegate: delegate)
    }
}
