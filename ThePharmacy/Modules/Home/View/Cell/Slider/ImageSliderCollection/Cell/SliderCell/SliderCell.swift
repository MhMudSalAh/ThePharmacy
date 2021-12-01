//
//  SliderCell.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class SliderCell: UICollectionViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgSlider: UIImageView!
    
    var slider: Slider? {
        didSet {
            setupCell()
        }
    }
    
    func setupCell(_ slider: Slider) {
        if self.slider == nil  {
            self.slider = slider
        }
    }
    
    func setupCell() {
        imgSlider.loadImage(slider?.image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
