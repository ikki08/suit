//
//  InitialViewModel.swift
//  suit
//
//  Created by Rizki Dwi Putra on 13/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class InitialViewModel: NSObject {
    func isPalindrome(text: String) -> Bool {
        let trimmingString = text.replacingOccurrences(of: " ", with: "").lowercased()
        let reversedString = String(trimmingString.reversed())
        return trimmingString == reversedString
    }
}
