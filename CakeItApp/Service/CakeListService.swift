//
//  CakeListService.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//

import Foundation

protocol CakeListingService {
    func getCakes(completionHandler: @escaping ([Cake]?, APIError?) -> ())
}

class DefaultCakeListService: CakeListingService{
    func getCakes(completionHandler: @escaping ([Cake]?, APIError?) -> ()) {
        let handler = CakeListHandler()
        let apiLoader = APILoader(apiHandler: handler)
        
        apiLoader.loadAPIRequest(urlParam: nil,
                                 queryParam: nil,
                                 bodyParam: nil)
        { content, error in
            completionHandler(content ,error)
        }
    }
}
