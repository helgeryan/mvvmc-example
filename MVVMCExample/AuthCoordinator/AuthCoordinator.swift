//
//  AuthCoordinator.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation
import UIKit

protocol AuthCoordinatorDelegate {
    func goToHome()
    func didFinish(_ coordinator: AuthCoordinator)
}

class AuthCoordinator : Coordinator {
    var delegate: AuthCoordinatorDelegate?
    var viewModel: AuthViewModel!
    var navigationController = UINavigationController()
    
    override func start() {
        print("AuthCoordinator Start")
        viewModel = AuthViewModel(nav: self)
        goToLoginPage()
    }
    
    let storyboard = UIStoryboard.init(name: "Auth", bundle: nil)

    deinit {
        print("AuthCoordinator Deinit")
    }
}

extension AuthCoordinator : AuthNavigation {
    func goToHome() {
        delegate?.goToHome()
        delegate?.didFinish(self)
    }
    
    func goToLoginPage() {
        // Instantiate LoginViewController
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        // Instantiate LoginViewModel and set the coordinator
        // Set the ViewModel to ViewController
        loginViewController.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToRegisterPage() {
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerViewController.viewModel = viewModel
        navigationController.pushViewController(registerViewController, animated: true)
    }
}
