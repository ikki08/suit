//
//  EventTableViewCell.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!

    func setCell(event: Event) {        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        eventImageView.image = event.image
        eventNameLabel.text = event.name
        eventDateLabel.text = dateFormatter.string(from: event.date)
        let radius = outerView.frame.size.height/8
        outerView.shadowStyle(with: radius)
        containerView.setRadius(radius: radius)
    }
}
