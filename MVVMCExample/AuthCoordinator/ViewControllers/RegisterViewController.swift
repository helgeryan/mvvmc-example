//
//  RegisterViewController.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    var viewModel : AuthViewModel?
    @IBOutlet weak var backToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backToLoginTapped(_ sender: Any) {
        viewModel?.goToHome()
    }
}
