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
    var viewController: UIViewController?
    
    static func assembled() -> UIViewController {
        let router: MainRouterProtocol = MainRouter()
        let repository: MoviesRepositoryProtocol = MoviesRepository()
        let interactor: MainInteractorProtocol = MainInteractor(repository: repository)
        var presenter: MainPresenterProtocol = MainPresenter(interactor: interactor, router: router)
        let viewController = ViewController(presenter: presenter)
        presenter.view = viewController as? MainPresenterDelegate
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func navigateToDetails(_ id: Int) {
        let vc = DetailsViewController(id: id)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
