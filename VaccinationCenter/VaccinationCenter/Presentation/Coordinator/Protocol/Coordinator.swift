//
//  Coordinator.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
