//
//  Coordinator.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
