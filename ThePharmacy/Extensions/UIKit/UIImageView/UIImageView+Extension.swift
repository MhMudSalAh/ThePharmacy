//
//  UIImageView+Extension.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(_ urlString: String?) {
        DispatchQueue.global().async {
            let imagePlaceholder = UIImage(named: "imageHolder")
            if let urlString = urlString, let url = URL(string: urlString) {
                self.sd_setImage(with: url, placeholderImage: imagePlaceholder) { (image, error, cacheType, url) -> Void in
                    DispatchQueue.main.async {
                        if error != nil {
                            self.image = imagePlaceholder
                        } else {
                            self.image = image
                        }
                    }
                }
                return
            }
            DispatchQueue.main.async {
                self.image = imagePlaceholder
            }
        }
    }
    
    func loadImageNative(_ urlString: String?) {
        let imagePlaceholder = UIImage(named: "imageHolder")
        if let urlString = urlString {
            NETWORK.loadImage(from: urlString) { [weak self] image in
                guard let self = self else { return }
                DispatchQueue.main.async { self.image = image }
            }
        }
        self.image = imagePlaceholder
    }
}
