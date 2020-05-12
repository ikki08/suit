//
//  EventListViewModel.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class EventListViewModel: NSObject {
    var eventList = Array<Event>()
    
    func createDummyEvent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let date1 = dateFormatter.date(from: "01-01-2020")
        let date2 = dateFormatter.date(from: "22-03-2020")
        let date3 = dateFormatter.date(from: "24-04-2020")
        let date4 = dateFormatter.date(from: "24-05-2020")
        
        let image1 = UIImage.init(named: "new_year")
        let image2 = UIImage.init(named: "isra_miraj")
        let image3 = UIImage.init(named: "ramadhan_image")
        let image4 = UIImage.init(named: "eid_mubarak")
        
        let event1 = Event(eventID: 0, name: "2020 New Year",
                           date: date1!, image: image1!)
        let event2 = Event(eventID: 1, name: "Isra Mi'raj",
                           date: date2!, image: image2!)
        let event3 = Event(eventID: 1, name: "1st Ramadhan 1441 H",
                           date: date3!, image: image3!)
        let event4 = Event(eventID: 1, name: "Eid Al-Fitr 1441 H",
                           date: date4!, image: image4!)
        
        eventList = [event1, event2, event3, event4]
    }
}
