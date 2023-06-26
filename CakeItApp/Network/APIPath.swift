//
//  APIPath.swift
//  CakeItApp
//
//  Created by selil on 26/06/23.
//

import Foundation

struct APIPath{
    
    private var baseURL:String
    
    init(){
        baseURL = AppEnvironment().getBaseURL()
    }
    
}
