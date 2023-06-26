//
//  AppEnvironment.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//

import Foundation

struct AppEnvironment {
    private let baseURL = "https://gist.githubusercontent.com/"
    
    func getBaseURL() -> String{
        return baseURL
    }
}
