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

    func goToLoginPage() {
        navigationController.viewControllers = []
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.delegate = self
        children.append(authCoordinator)
        authCoordinator.start()
    }
    
    func goToRegisterPage() {
        
    }
    
    func childDidFinish(_ coordinator: Coordinator) {
        
    }
}


extension AppCoordinator: AuthCoordinatorDelegate {
    func didFinish(_ coordinator: AuthCoordinator) {
        
    }
    
    func goToHome() {
        navigationController.viewControllers = []
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.delegate = self
        children.append(homeCoordinator)
        homeCoordinator.start()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func goToAuth() {
        goToLoginPage()
    }
    
    func didFinish(_ coordinator: HomeCoordinator) {
        
    }
    
    
}
