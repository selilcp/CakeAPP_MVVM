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
    
    var getCakeList:String { "\(baseURL)hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList" }
}
