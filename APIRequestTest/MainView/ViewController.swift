//
//  ViewController.swift
//  APIRequestTest
//
//  Created by Joyce Rosario Batista on 18/12/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 200
        tableView.allowsSelection = false
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return tableView
    }()
    
    var data: [MovieView.Model] = []
    var presenter: MainPresenterProtocol
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.fill(with: tableView, edges: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        presenter.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        cell.configure(with: data[indexPath.row])
        return cell
    }
}

extension ViewController: MainPresenterDelegate {
    func moviesLoaded(_ movies: [MovieView.Model]) {
        data = movies
        DispatchQueue.main.async { [weak self]  in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}
