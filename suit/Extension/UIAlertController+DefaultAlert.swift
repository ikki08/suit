//
//  UIAlertController+DefaultAlert.swift
//
//  Created by Rizki Dwi Putra on 03/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

extension UIAlertController {
    static var defaultAlert: UIAlertController {        
        return UIAlertController.standardAlert(title: "Warning!",
                                               message: "Something went wrong!")
    }
    
    static func standardAlert(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.cancel))
        
        return alert
    }
    
    static func standardActionSheet(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.cancel))
        
        return alert
    }
}
