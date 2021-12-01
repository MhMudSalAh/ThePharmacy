//
//  Home+TableView.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit
import SkeletonView

extension HomeController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func setupTableView() {
        tableView.initialize(cellClass: CollectionViewHorizontalCell.self, delegate: self, dataSource: self, estimatedRowHeight: 100, refreshControl: refreshTable)
        tableView.registerCellNib(cellClass: ImageSlider.self)
        tableView.registerCellNib(cellClass: SectionCell.self)
        tableView.contentInset.top = 16
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshTable != nil {
            if refreshTable!.isRefreshing && scrollView.contentOffset.y < 0 {
                presenter.viewDidLoad()
            } else {
                endRefresherTable()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        switch indexPath.row {
        case 0:
            return "SectionCell"
        case 1:
            return "ImageSlider"
        case 2:
            return "SectionCell"
        default:
            return "CollectionViewHorizontalCell"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: SectionCell.self)
            cell.hideSkeleton()
            cell.setupCell(localizedText("new_offers"), false, self, .Offers)
            return cell
        case 1:
            let cell = tableView.dequeue(cellClass: ImageSlider.self)
            cell.hideSkeleton()
            cell.setupCell(sliders)
            return cell
        case 2:
            let cell = tableView.dequeue(cellClass: SectionCell.self)
            cell.hideSkeleton()
            cell.setupCell(localizedText("categories"), false, self, .Categories)
            return cell
        default:
            let cell = tableView.dequeue(cellClass: CollectionViewHorizontalCell.self)
            cell.hideSkeleton()
            cell.setupCell(categories)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 2:
            return 50
        case 1:
            return 200
        default:
            return categories.count % 4 == 0 ? CGFloat((categories.count / 4) * 120) : CGFloat((Int(categories.count / 4) + 1) * 120)
        }
    }
}
