//
//  MainCoordinator.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let builder = MainViewBuilder(coordinator: self)
        navigationController.pushViewController(builder.build(), animated: true)
    }
}
