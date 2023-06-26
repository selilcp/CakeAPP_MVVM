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
}
