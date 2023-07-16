//
//  ViewModel.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation

protocol AuthNavigation : AnyObject{
    func goToLoginPage()
    func goToRegisterPage()
    func goToHome()
}

class AuthViewModel {
    var navigation : AuthNavigation
    
    init(nav : AuthNavigation) {
        self.navigation = nav
    }
    
    func goToRegister(){
        navigation.goToRegisterPage()
    }
    
    func goToHome(){
        navigation.goToHome()
    }
    
    func goToLogin() {
        navigation.goToLoginPage()
    }
}
