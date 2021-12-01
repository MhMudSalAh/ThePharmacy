//
//  CollectionViewCell+Extension.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//


import UIKit
import SkeletonView

extension CollectionViewHorizontalCell: UICollectionViewDelegate, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "HomeCategoryCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categories == nil {
            return 0
        } else {
            return categories!.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: HomeCategoryCell.self, indexPath: indexPath)
        cell.hideSkeleton()
        if categories != nil {
            cell.setupCell(categories![indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.frame.size
        size.width = 85
        size.height = 120
        return size
    }
}
