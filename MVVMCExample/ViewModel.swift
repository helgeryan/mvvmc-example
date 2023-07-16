//
//  ViewModel.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//


import Foundation

protocol LoginNavigation : AnyObject{
    func goToLoginPage()
    func goToRegisterPage()
    func goToHome()
}

class LoginViewModel {
    weak var navigation : LoginNavigation!
    
    init(nav : LoginNavigation) {
        self.navigation = nav
    }
    
    func goToRegister(){
        navigation.goToRegisterPage()
    }
    
    func goToHome(){
        navigation.goToHome()
    }
    
    deinit {
        print("Deinit login")
    }
}


protocol RegisterNavigation : AnyObject{
    func goToLoginPage()
}

class RegisterViewModel {
    weak var navigation : RegisterNavigation!
    
    init(nav : RegisterNavigation) {
        self.navigation = nav
    }
    
    func goToLogin(){
        navigation.goToLoginPage()
    }
}
