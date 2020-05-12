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
    func endpoint() -> String {
        return "/users"
    }
    
    func method() -> HTTPMethod {
        return .get
    }
}
