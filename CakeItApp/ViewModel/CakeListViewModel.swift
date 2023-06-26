//
//  CakeListViewModel.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//

import Foundation

class CakeListViewModel{
    
    var cakes:[Cake]?
    var service: DefaultCakeListService
    
    init (service: DefaultCakeListService) {
        self.service = service
    }
    
    var cakesCount: Int?{
        return cakes?.count
    }
    
    func fetchCakeList(complitionHandler: @escaping (APIError?) -> () ){
        service.getCakes(completionHandler: { [weak self] (content, error) in
            self?.cakes = content
            complitionHandler(error)
        })
    }
    
    func getCakeWithPosition(pos:Int) -> Cake?{
        guard let cakes = cakes else { return nil }
        if cakes.indices.contains(pos){
            return cakes[pos]
        }
        return nil
    }
}
