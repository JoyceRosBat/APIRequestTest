//
//  MovieTableViewCell.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let view = MovieView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.fill(with: view)
    }
    
    func configure(with model: MovieView.Model) {
        view.configure(with: model)
    }
    
}

class MovieView: UIView {
    
    // MARK: - Model
    
    struct Model {
        typealias Action = (Int) -> Void
        let id: Int
        let imagePath: String
        let originalTitle: String
        let action: Action
        
        static let mock: Model = .init(id: 0, imagePath: "", originalTitle: "", action: { _ in })
    }
    
    // MARK: - Views
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [
            imageContainerView,
            label
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        
        view.fill(with: stackView)
        
        let button = UIButton()
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        view.fill(with: button)
        
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
        imageView.loadImage(at: model.imagePath, placeHolder: UIImage(systemName: "photo"))
        label.text = model.originalTitle
    }
    
    @objc func onTap() {
        model.action(model.id)
    }
}
