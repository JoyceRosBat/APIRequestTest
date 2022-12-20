//
//  MainRouter.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import UIKit

protocol MainRouterProtocol {
    func navigateToDetails(_ id: Int)
}

final class MainRouter: MainRouterProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func assembled() -> ViewController {
        let repository: MoviesRepositoryProtocol = MoviesRepository()
        let interactor: MainInteractorProtocol = MainInteractor(repository: repository)
        var presenter: MainPresenterProtocol = MainPresenter(interactor: interactor, router: self)
        let viewController = ViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
    
    func navigateToDetails(_ id: Int) {
        let vc = DetailsViewController(id: id)
        navigationController.pushViewController(vc, animated: true)
    }
}
