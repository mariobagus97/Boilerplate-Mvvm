//
//  ProductDetailViewModel.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 12/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class ProductDetailViewModel: BaseViewModel {
    
    var product : PublishSubject<ProductPromo> = PublishSubject()
    
   
    override init() {
        
    }
}
