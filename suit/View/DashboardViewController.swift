//
//  DashboardViewController.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseEventButton: UIButton!
    @IBOutlet weak var chooseGuestButton: UIButton!
    
    var viewModel = DashboardViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: \(viewModel.name)"
        chooseEventButton.applyStyle()
        chooseGuestButton.applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EventListViewController {
            destination.delegate = self
        } else if let destination = segue.destination as? GuestListViewController {
            destination.delegate = self
        }
    }
}

extension DashboardViewController: EventListDelegate {
    func didSelectEvent(with name: String) {
        navigationController?.popViewController(animated: true)
        chooseEventButton.setTitle(name, for: .normal)
    }
}

extension DashboardViewController: GuestListDelegate {
    func didSelectGuest(_ guest: Guest) {
        let guestName = guest.firstName + " " + guest.lastName
        navigationController?.popViewController(animated: true)
        chooseGuestButton.setTitle(guestName, for: .normal)
        let phoneOS = viewModel.getGuestPhoneOS(id: guest.guestID)
        let alert = UIAlertController.standardActionSheet(title: phoneOS, message: nil)
        self.present(alert, animated: true, completion: nil)
    }
}
