//
//  MainPresenter.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 20/12/22.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
    var view: MainPresenterDelegate?
    var interactor: MainInteractorProtocol
    var router: MainRouterProtocol
    
    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        Task {
            let movies = try await interactor.getMovies()
            let viewModel = moviesViewModel(movies)
            view?.moviesLoaded(viewModel)
        }
    }
    
    func moviesViewModel(_ movies: [Item]) -> [MovieView.Model] {
        movies.compactMap({ item in
            MovieView.Model(
                id: item.id,
                imagePath: item.posterPath,
                originalTitle: item.originalTitle,
                action: { [weak self] id in
                    guard let self = self else { return }
                    self.router.navigateToDetails(id)
                }
            )
        })
    }
}
