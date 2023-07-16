//
//  AppCoordinator.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//
import Foundation
import UIKit

class AppCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
         // The first time this coordinator started, is to launch login page.
        goToLoginPage()
    }
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    func goToLoginPage() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        children.append(authCoordinator)
        authCoordinator.start()
//         // Instantiate LoginViewController
//         let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//         // Instantiate LoginViewModel
//        let loginViewModel = LoginViewModel.init(nav: <#LoginNavigation#>)
//         // Set the Coordinator to the ViewModel
//         loginViewModel.appCoordinator = self
//         // Set the ViewModel to ViewController
//         loginViewController.viewModel = loginViewModel
//         // Push it.
//        navigationController.pushViewController(loginViewController, animated: true)
    }
    func goToRegisterPage() {
//        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
//        let registerViewModel = RegisterViewModel.init()
//        registerViewModel.appCoordinator = self
//        registerViewController.viewModel = registerViewModel
//        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func goToHome() {
        
    }
    
    func childDidFinish(_ coordinator: Coordinator) {
        
    }
}


class AuthCoordinator : Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("AuthCoordinator Start")
        goToLoginPage()
    }
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)

    deinit {
        print("AuthCoordinator Deinit")
    }
    
    func childDidFinish(_ coordinator: Coordinator) {
        
    }
    
}

extension AuthCoordinator : LoginNavigation, RegisterNavigation {
    func goToHome() {
        // Get the app coordinator
        let appC = parentCoordinator as! AppCoordinator
        // And go to home!
        appC.goToHome()
        // Remember to clean up
        parentCoordinator?.childDidFinish(self)
    }
    
    func goToLoginPage() {
        // Instantiate LoginViewController
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        // Instantiate LoginViewModel and set the coordinator
        let loginViewModel = LoginViewModel.init(nav: self)
        // Set the ViewModel to ViewController
        loginViewController.viewModel = loginViewModel
        // Push it.
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToRegisterPage() {
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        let registerViewModel = RegisterViewModel.init(nav: self)
        registerViewController.viewModel = registerViewModel
        navigationController.pushViewController(registerViewController, animated: true)
    }
}
