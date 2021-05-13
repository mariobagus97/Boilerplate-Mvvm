//
//  SearchViewModel.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 13/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel: BaseViewModel {
    
    let ListProduct = BehaviorRelay<[ProductPromo]>(value: [ProductPromo]())
    
    func getMockData() {
//        Observable<ProductPromo>.create { (observer) -> Disposable in
////            observer.onNext(ProductPromo(from: <#Decoder#>))
//            observer.onCompleted()
//            return Disposables.create()
//        }
        
//        ListProduct.accept(<#T##event: [ProductPromo]##[ProductPromo]#>)
        
    }
    
}
