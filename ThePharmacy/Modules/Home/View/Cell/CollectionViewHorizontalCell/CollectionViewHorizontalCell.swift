//
//  CollectionViewHorizontalCell.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit
import SkeletonView

class CollectionViewHorizontalCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [Category]? {
        didSet {
            reloadCollection()
        }
    }
    
    func setupCell(_ categories: [Category]) {
        if self.categories == nil {
            self.categories = categories
        }
    }
    
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupCollectionView() {
        collectionView.initialize(cellClass: HomeCategoryCell.self, delegate: self, dataSource: self)
        collectionView.contentInset.right = 15
        collectionView.contentInset.left = 15
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
