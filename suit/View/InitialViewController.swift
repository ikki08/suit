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
    @IBOutlet weak var palindromeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    let viewModel = InitialViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.applyStyle()
        checkButton.applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Action

    @IBAction func checkButtonTapped(_ sender: Any) {
        guard let text = palindromeTextField.text, text.count > 0 else {
            let alert = UIAlertController.standardAlert(title: "Warning!", message: "Please put text on text field!")
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        var alert: UIAlertController
        if viewModel.isPalindrome(text: text) {
            alert = UIAlertController.standardAlert(title: nil, message: "isPalindrome")
        } else {
            alert = UIAlertController.standardAlert(title: nil, message: "not palindrome")
        }
        
        self.present(alert, animated: true, completion: nil)
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

