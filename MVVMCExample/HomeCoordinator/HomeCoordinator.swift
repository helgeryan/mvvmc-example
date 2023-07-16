//
//  HomeCoordinator.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate {
    func goToAuth()
    func didFinish(_ coordinator: HomeCoordinator)
}

class HomeCoordinator : Coordinator {
    var delegate: HomeCoordinatorDelegate?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var viewModel: HomeViewModel!
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("HomeCoordinator Start")
        viewModel = HomeViewModel(nav: self)
        goToHomePage()
    }
    
    let storyboard = UIStoryboard.init(name: "Home", bundle: nil)

    deinit {
        print("HomeCoordinator Deinit")
    }
    
    func childDidFinish(_ coordinator: Coordinator) {
        
    }
    
    func goToHomePage() {
        // Instantiate HomeViewController
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        // Instantiate LoginViewModel and set the coordinator
        // Set the ViewModel to ViewController
        homeViewController.viewModel = viewModel
        // Push it.
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator : HomeNavigation {
    func goToLoginPage() {
        delegate?.goToAuth()
        delegate?.didFinish(self)
    }
}

