//
//  EventListViewController.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

protocol EventListDelegate: class {
    func didSelectEvent(with name: String)
}

class EventListViewController: UIViewController {
    @IBOutlet weak var eventTableView: UITableView!
    
    let viewModel = EventListViewModel()
    weak var delegate: EventListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "EVENTS"
        viewModel.createDummyEvent()
        eventTableView.reloadData()
    }
}

// MARK: -

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = viewModel.eventList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        cell.setCell(event: event)
        
        return cell
    }
    
    // MARK: Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let event = viewModel.eventList[indexPath.row]
        delegate?.didSelectEvent(with: event.name)
    }
}
