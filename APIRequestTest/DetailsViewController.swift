//
//  DetailsViewController.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

class DetailsViewController: UIViewController {
    lazy var detailsView: DetailsView = {
        let view = DetailsView()
        return view
    }()
    
    let id: Int
    weak var coordinator: Coordinator?
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let repository = MoviesRepository()
        
        Task {
            let details = try await repository.getMovieDetails(id)
            detailsView.configure(with: DetailsView.Model(
                originalTitle: details.originalTitle,
                overview: details.overview,
                posterPath: details.backdropPath
            ))
        }
        
        view.fill(with: detailsView, edges: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
}
