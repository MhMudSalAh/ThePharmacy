//
//  Base+Refresher.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit

extension BaseController {
    
    func addRefresherTable(_ tableView: UITableView, _ color: UIColor? = .primary) {
        tableView.refreshControl = refreshTable
        refreshTable?.tintColor = color
        refreshTable?.beginRefreshing()
    }
    
    func endRefresherTable() {
        if refreshTable != nil {
            if refreshTable!.isRefreshing {
                refreshTable?.endRefreshing()
            }
        }
    }
    
    func addRefresherCollection(_ collection: UICollectionView, _ color: UIColor? = .primary) {
        collection.refreshControl = refreshCollection
        refreshCollection?.tintColor = color
        refreshCollection?.beginRefreshing()
    }
    
    func endRefresherCollection() {
        if refreshCollection != nil {
            if refreshCollection!.isRefreshing {
                refreshCollection?.endRefreshing()
            }
        }
    }
}
