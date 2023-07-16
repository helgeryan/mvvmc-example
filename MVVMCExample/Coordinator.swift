//
//  Coordinator.swift
//  MVVMCExample
//
//  Created by Ryan Helgeson on 7/16/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    func childDidFinish(_ coordinator: Coordinator)
    func start()
}
