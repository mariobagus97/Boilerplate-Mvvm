//
//  PurchaseHistoryViewModel.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 13/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class PurchaseHistoryViewModel: BaseViewModel {
    
    let ListProduct = BehaviorRelay<[ProductPromo]>(value: [ProductPromo]())
}
