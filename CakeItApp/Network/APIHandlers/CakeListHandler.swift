//
//  CakeListHandler.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//

import Foundation

class CakeListHandler: APIHandler {
    
    func makeRequest(urlParam urls: [String: String]?,
                     queryParam query: [String : String]?,
                     bodyParam body: [String : Any]?) -> URLRequest? {
        
        let urlString =  APIPath().getCakeList
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [Cake] {
        return try defaultParseResponse(data: data, response: response)
    }
}
