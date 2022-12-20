//
//  DetailsView.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

class DetailsView: UIView {
    
    // MARK: - Model
    
    struct Model {
        let originalTitle: String
        let overview: String
        let posterPath: String
        
        static let mock: Model = .init(originalTitle: "", overview: "", posterPath: "")
    }
    
    // MARK: - Views
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.size.width * 9) / 16).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            titleLabel,
            overviewLabel,
            UIView()
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.fill(with: stackView)
        
        return view
    }()
    
    // Define views for component
    
    // MARK: - Properties
    
    var model: Model = .mock
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    private func setupView() {
        fill(with: mainView)
    }
    
    func configure(with model: Model) {
        self.model = model
        imageView.loadImage(at: model.posterPath, placeHolder: UIImage(systemName: "photo"))
        titleLabel.text = model.originalTitle
        overviewLabel.text = model.overview
    }
}
