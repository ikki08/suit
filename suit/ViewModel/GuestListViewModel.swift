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
    var page = 0
    
    func getGuestList(completion:@escaping (_ error: Error?) -> Void) {
        let getGuestsRequest = GetGuestsRequest(page: page + 1)
        let restRequest = RESTRequest()
        restRequest.execute(request: getGuestsRequest,
                            success: { response in
                                let jsonResponse = JSON(response)
                                if let data = jsonResponse["data"].array,
                                    data.count > 0 {
                                    self.parseGetGuestList(data: data)
                                    self.page += 1
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
    
    func isPrime(_ number: Int) -> Bool {
        if number <= 3 {
            return number > 1
        } else if number % 2 == 0 || number % 3 == 0 {
            return false
        }
        
        var counter = 5
        while counter * counter <= number {
            if number % counter == 0 || number % (counter + 1) == 0 {
                return false
            }
            
            counter += 6
        }
        
        return true
    }
}
