//
//  ImageSlider.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit
import SkeletonView

class ImageSlider: UITableViewCell {
    
    @IBOutlet weak var collectionImages: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var scrollTimer: Timer!
    
    var sliders: [Slider]? {
        didSet {
            reloadData()
        }
    }
    
    var currentIndexPath = IndexPath(row: 0, section: 0) {
        didSet {
            DispatchQueue.main.async { [self] in
                scrollToNext()
            }
        }
    }
    
    func setupCell(_ sliders: [Slider]) {
        if self.sliders == nil || (self.sliders?.isEmpty ?? false) {
            self.sliders = sliders
        }
    }
    
    func reloadData() {
        if !(sliders?.isEmpty ?? true) {
            reloadCollection()
            lblTitle.isHidden = true
            startScroll(collectionImages)
        } else {
            lblTitle.text = localizedText("sorry_no_offers")
            lblTitle.isHidden = false
        }
    }
    
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionImages.reloadData()
        }
    }
    
    func scrollToNext() {
        collectionImages.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionImages.initialize(cellClass: SliderCell.self, delegate: self, dataSource: self)
    }
}

extension ImageSlider: UICollectionViewDelegate, SkeletonCollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "SliderCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders?.count  ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: SliderCell.self, indexPath: indexPath)
        cell.setupCell(sliders![indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return size
    }
    
    func startScroll(_ collectionView: UICollectionView) {
        if scrollTimer == nil || !scrollTimer.isValid {
            scrollTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextCell(_:)), userInfo: collectionView, repeats: true)
        }
    }
    
    @objc func scrollToNextCell(_ timer: Timer) {
        if currentIndexPath.row == sliders!.count - 1 {
            currentIndexPath.row = 0
        } else {
            currentIndexPath.row += 1
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        startScroll(collectionImages)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView, collectionView.tag == 0 {
            scrollTimer.invalidate()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        currentIndexPath.row = Int(pageNumber)
    }
}
