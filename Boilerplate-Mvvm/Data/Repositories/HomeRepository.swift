//
//  HomeRepository.swift
//  Boilerplate-Mvvm
//
//  Created by Muhammad Ario Bagus on 12/05/21.
//

import Foundation
import RxSwift

protocol IHomeRepository {
    func GetHomeItem() -> Single<([Category], [ProductPromo])>
}

class HomeRepository: IHomeRepository  {
    
    private let homeService : HomeService
    init(homeService : HomeService) {
        self.homeService = homeService
    }
    
    func GetHomeItem() -> Single<([Category], [ProductPromo])> {
        let products =  homeService.GetHeroes().map { (response) -> ([Category], [ProductPromo]) in
            return (response[0].data.category , response[0].data.productPromo)
        }
        return products
    }
   
}
