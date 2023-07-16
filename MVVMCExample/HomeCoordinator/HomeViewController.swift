//
//  HomeViewController.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation
import UIKit

class HomeViewController : UIViewController {
    var viewModel : HomeViewModel?
    @IBOutlet weak var backToLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        viewModel?.goToLogin()
     }
}
