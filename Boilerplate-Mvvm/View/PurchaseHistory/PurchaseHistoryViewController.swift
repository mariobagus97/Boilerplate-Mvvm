//
//  PurchaseHistoryViewController.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 13/05/21.
//

import UIKit

class PurchaseHistoryViewController: BaseViewController<PurchaseHistoryViewModel> {

    @IBOutlet weak var purchaseHistoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        view.backgroundColor = UIColor.blue
        
        purchaseHistoryTableView.rx
            .modelSelected(ProductPromo.self)
            .subscribe { (item) in
                self.gotoProductDetail(product: item)
            }
            .disposed(by: disposeBag)

        viewModel.ListProduct.bind(to: purchaseHistoryTableView.rx.items(cellIdentifier: "cellId", cellType: PurchaseHistoryCell.self)) { (row,item,cell) in
            cell.lblName.text = item.title
            cell.imgProduct.loadImage(fromURL: item.imageURL)
            cell.lblPrice.text = item.price
        }
            .disposed(by: disposeBag)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    func gotoProductDetail(product : ProductPromo) {
        self.navigationController?.pushViewController(ProductDetailViewController(product: product), animated: false)
    }
    
    func setupTableView() {
        purchaseHistoryTableView.rowHeight = UITableView.automaticDimension
        purchaseHistoryTableView.register(UINib(nibName: "PurchaseHistoryCell", bundle: nil), forCellReuseIdentifier: "cellId")
        purchaseHistoryTableView.reloadData()
    }
    
    func setupNavigationBar(){
        
        self.navigationItem.title = "Purchase History"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icBack")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    @objc func backTapped(){
        navigationController?.popViewController(animated: false)
    }
}
