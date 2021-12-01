//
//  CellId.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import Foundation

enum SectionCellType {
    case Categories
    case Offers
}

protocol SeeAllDelegate {
    func didCliecked(_ type: SectionCellType?)
}
