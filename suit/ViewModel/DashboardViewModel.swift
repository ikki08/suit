//
//  DashboardViewModel.swift
//  suit
//
//  Created by Rizki Dwi Putra on 12/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class DashboardViewModel: NSObject {
    var name = ""
    
    func getGuestPhoneOS(id: Int) -> String {
        if id % 2 == 0 {
            if id % 3 == 0 {
                return "iOS"
            } else {
                return "Blackberry"
            }
        } else if id % 3 == 0 {
            return "Android"
        } else {
            return "Feature phone"
        }
    }
}
