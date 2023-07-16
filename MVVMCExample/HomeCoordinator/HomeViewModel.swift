//
//  HomeViewModel.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation

protocol HomeNavigation: AnyObject {
    func goToLoginPage()
}

class HomeViewModel {
    var navigation : HomeNavigation
    
    init(nav : HomeNavigation) {
        self.navigation = nav
    }
    
    func goToLogin() {
        navigation.goToLoginPage()
    }
}
