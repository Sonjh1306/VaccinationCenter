//
//  MainCoordinator.swift
//  VaccinationCenter
//
//  Created by sonjuhyeong on 2023/08/24.
//

import UIKit

class CenterListCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let centerListViewController = CenterListViewController()
        let viewModel = CenterListViewModel(useCase: DefaultCenterListUseCase(centerListRepository: DefaultCenterListRepository(wrapper: .init(plugins: [NetworkLoggerPlugin()]))))
        centerListViewController.configureViewModel(viewModel)
        centerListViewController.coordinator = self
        self.navigationController.pushViewController(centerListViewController, animated: true)
    }
}
