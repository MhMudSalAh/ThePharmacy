//
//  HomeCategoryCell.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var category: Category? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell(_ category: Category) {
        if self.category == nil {
            self.category = category
        }
        
    }
    
    func setupCell() {
        img.loadImage(category?.image)
        if LOCAL.getLanguage() == Language.EN.rawValue {
            lblTitle.text = category?.titleEN
        } else {
            lblTitle.text = category?.titleAR
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
