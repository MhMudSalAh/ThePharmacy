//
//  SectionCell.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

class SectionCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    var deleagate: SeeAllDelegate? = nil
    var type: SectionCellType? = nil
    
    func setupCell(_ title: String, _ hideSeeAll: Bool, _ deleagate: SeeAllDelegate?, _ type: SectionCellType?) {
        if lblTitle.text?.isEmpty ?? false {
            lblTitle.text = title
            btnSeeAll.isHidden = hideSeeAll
        }
        if self.deleagate == nil {
            self.deleagate = deleagate
            self.type = type
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        btnSeeAll.setTitle(localizedText("all_offers"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func seeAllAction(_ sender: Any) {
        deleagate?.didCliecked(type)
    }
}
