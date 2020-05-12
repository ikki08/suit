//
//  GuestListViewModel.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SwiftyJSON

class GuestListViewModel: NSObject {
    var guestList = Array<Guest>()
    
    func getGuestList(completion:@escaping (_ error: Error?) -> Void) {
        let getGuestsRequest = GetGuestsRequest()
        let restRequest = RESTRequest()
        restRequest.execute(request: getGuestsRequest,
                            success: { response in
                                let jsonResponse = JSON(response)
                                if let data = jsonResponse["data"].array,
                                    data.count > 0 {
                                    self.parseGetGuestList(data: data)
                                    completion(nil)
                                } else {
                                    completion(NSError.defaultError)
                                }
        },
                            failure: { error in
                                completion(error)
        })
    }
    
    func parseGetGuestList(data: [JSON]) {
        for guestJSON in data {
            let guest = Guest.init(json: guestJSON)
            guestList.append(guest)
        }
    }
}
