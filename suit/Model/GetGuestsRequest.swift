//
//  GetGuestsRequest.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import Foundation
import Alamofire

class GetGuestsRequest: APIRequest {
    var page = 0
    var dataPerPage = 0
    
    init(page: Int, dataPerPage: Int = 10) {
        self.page = page
        self.dataPerPage = dataPerPage
    }
    
    func endpoint() -> String {
        return "/users?page=\(page)&per_page=\(dataPerPage)"
    }
    
    func method() -> HTTPMethod {
        return .get
    }
}
