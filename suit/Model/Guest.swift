//
//  Guest.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Guest {
    var guestID: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatarURL: String
    
    init(json: JSON) {
        guestID = json["id"].int!
        email = json["email"].string!
        firstName = json["first_name"].string!
        lastName = json["last_name"].string!
        avatarURL = json["avatar"].string!
    }
}
