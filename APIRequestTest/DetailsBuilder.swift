//
//  DetailsBuilder.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import Foundation

struct DetailsBuilder: Builder {
    let coordinator: Coordinator
    let id: Int
    
    func build() -> UIViewController {
        let viewController = DetailsViewController(id: id)
        viewController.coordinator = coordinator
        return viewController
    }
}
