//
//  HomeController.swift
//  ThePharmacy
//
//  Created by MhMuD SalAh on 30/11/2021.
//

import UIKit
import SkeletonView

class HomeController: BaseController {
    
    @IBOutlet weak var viewCornered: UIView!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var lblOrderImage: UILabel!
    @IBOutlet weak var lblOrderReceipt: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterInterface!
    
    var btnLanguage = UIBarButtonItem()
    var group = DispatchGroup()
    
    var sliders: [Slider] = []
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupTitles()
        setupLangBtn()
        setupViewCornered()
        setupTxtFld()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    func setupViewCornered() {
        viewCornered.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func setupTitles() {
        navigationItem.title = localizedText("app_name")
        lblOrderImage.text = localizedText("order_with_image")
        lblOrderReceipt.text = localizedText("order_with_receipt")
    }
    
    func setupLangBtn() {
        btnLanguage = UIBarButtonItem(title: localizedText("_current_language"), style: .plain, target: self, action: #selector(didClickLanguageBtn))
        navigationItem.rightBarButtonItem = btnLanguage
    }
    
    @objc fileprivate func didClickLanguageBtn(_ sender: Any?) {
        showLanguageAlert()
    }
    
    func setupTxtFld(){
        txtFldSearch.setPlaceHolder("search_for_products", UIFont.boldFont(ofSize: 18), .gray)
    }
    
    @IBAction func actionOrderImage(_ sender: Any) {
        
    }
    
    @IBAction func actionOrderReceipt(_ sender: Any) {
        
    }
    
}

extension HomeController: HomeView {
    
    func reloadData() {
        group.notify(queue: .main) { [self] in
            tableView.reloadData()
            hideNetworkErrorScreen()
            hideLoading()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.view.showAnimatedGradientSkeleton()
        }
    }
    
    func hideLoading() {
        endRefresherTable()
        view.hideSkeleton()
    }
    
    func presentNetworkErrorScreen() {
        showNetworkErrorScreen(self, self.view)
    }
    
    func hideNetworkErrorScreen() {
        closeNetworkErrorScreen()
    }
    
    func showLanguageAlert() {
        ALERT.atToFavourite(vc: self, delegate: self)
    }
}
