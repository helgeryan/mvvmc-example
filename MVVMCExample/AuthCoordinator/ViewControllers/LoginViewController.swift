//
//  ViewController.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import UIKit

class LoginViewController : UIViewController {
    var viewModel : AuthViewModel?
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        viewModel?.goToRegister()
     }
}
