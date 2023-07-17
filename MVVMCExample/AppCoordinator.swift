//
//  AppCoordinator.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//
import Foundation
import UIKit

class AppCoordinator : Coordinator {
    
    let window: UIWindow?
    init(window: UIWindow?) {
      self.window = window
    }
    
    override func start() {
         // The first time this coordinator started, is to launch login page.
        goToLoginPage()
    }

    func goToLoginPage() {
        let authCoordinator = AuthCoordinator()
        authCoordinator.delegate = self
        children.append(authCoordinator)
        authCoordinator.start()
        window?.rootViewController = authCoordinator.navigationController // Need to somehow change the navigation controller
    }
    
    func goToRegisterPage() {
        
    }
}


extension AppCoordinator: AuthCoordinatorDelegate {
    func didFinish(_ coordinator: AuthCoordinator) {
       self.removeChildCoordinator(coordinator)
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.delegate = self
        children.append(homeCoordinator)
        homeCoordinator.start()
        window?.rootViewController = homeCoordinator.navigationController
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func goToAuth() {
        goToLoginPage()
    }
    
    func didFinish(_ coordinator: HomeCoordinator) {
        
    }
}
