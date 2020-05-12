//
//  GuestListViewController.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

protocol GuestListDelegate: class {
    func didSelectGuest(_ guest: Guest)
}

class GuestListViewController: UIViewController {
    @IBOutlet weak var guestCollectionView: UICollectionView!
    
    let viewModel = GuestListViewModel()
    weak var delegate: GuestListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GUESTS"
        fetchGuestList()
    }
    
    func fetchGuestList() {
        viewModel.getGuestList()  { error in
            if error == nil {
                self.guestCollectionView.reloadData()
            } else {
                let alert = UIAlertController.defaultAlert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension GuestListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.guestList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let guest = viewModel.guestList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuestCell", for: indexPath) as! GuestCollectionViewCell
        cell.setCell(guest: guest)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension GuestListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let guest = viewModel.guestList[indexPath.row]
        delegate?.didSelectGuest(guest)
    }
}
