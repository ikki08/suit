//
//  InitialViewController.swift
//  suit
//
//  Created by Rizki Dwi Putra on 11/05/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.applyStyle()
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
        if segue.identifier == "InitialToDashboardSegue",
            let destination = segue.destination as? DashboardViewController,
            let name = nameTextField.text {
            let dashboardViewModel = DashboardViewModel()
            dashboardViewModel.name = name
            destination.viewModel = dashboardViewModel
        }
    }
}

