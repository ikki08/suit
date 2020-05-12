//
//  GuestCollectionViewCell.swift
//  suit
//
//  Created by Rizki Dwi Putra on 12/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class GuestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setCell(guest: Guest) {
        nameLabel.text = guest.firstName + " " + guest.lastName
    }
}
