//
//  CitiesListViewController.swift
//  Cities
//
//  Created by Judar Lima on 06/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    private weak var presenter: CitiesListPresenterLogic?
    private var interactor: CitiesListInteractorLogic?
    private var viewModel = [CityViewModel]()
    private var coordinator: MainCoordinator?
    private let cellIdentifier = "CityTableViewCell"
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    init(coordinator: MainCoordinator,
        interactor: CitiesListInteractorLogic,
         presenter: CitiesListPresenterLogic) {
        super.init(nibName: "CitiesListViewController", bundle: Bundle.main)
        self.coordinator = coordinator
        self.presenter = presenter
        self.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        searchBar.delegate = self
        interactor?.listCities()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        setupTableViewBackground()
        let footerView = UIView()
        footerView.backgroundColor = .clear
        tableView.tableFooterView = footerView
        registerCell()
    }
    
    private func setupTableViewBackground() {
        let imageView = UIImageView(image: UIImage(named: "city-background"))
        imageView.contentMode = .scaleAspectFill
        tableView.backgroundView = imageView
        tableView.backgroundColor = .clear
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: cellIdentifier,
                                      bundle: nil),
                                forCellReuseIdentifier: cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CitiesListViewController: CitiesListDisplayLogic {
    func displayError(message: String) {
        print(message)
    }
    
    func displayCities(viewModel: [CityViewModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.viewModel = viewModel
            self?.tableView.reloadData()
        }
    }
}

extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.cityDetail(viewModel: viewModel[indexPath.row])
    }
    
}

extension CitiesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityTableViewCell
            else { return UITableViewCell() }
        cell.bind(viewModel: viewModel[indexPath.row])
        return cell
    }
    
}

extension CitiesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            interactor?.listCities()
        } else {
            interactor?.searchCity(with: searchText)
        }
    }
}
