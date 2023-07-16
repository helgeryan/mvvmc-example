//
//  ViewController.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

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

enum ViewControllerState {
    case loading(animated: Bool)
}

