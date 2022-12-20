//
//  MainViewBuilder.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import UIKit

struct MainViewBuilder: Builder {
    let coordinator: Coordinator
    
    func build() -> UIViewController {
        let viewController = ViewController()
        viewController.coordinator = coordinator
        return viewController
    }
}
