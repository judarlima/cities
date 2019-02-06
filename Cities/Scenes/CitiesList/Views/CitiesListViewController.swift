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
    private weak var interactor: CitiesListInteractorLogic?
    private var viewModel = [CityViewModel]()
    @IBOutlet private weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        setupTableViewBackground()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupTableViewBackground() {
        let imageView = UIImageView(image: UIImage(named: "city-background"))
        imageView.contentMode = .scaleAspectFill
        tableView.backgroundView = imageView
    }
    
    init(interactor: CitiesListInteractorLogic,
         presenter: CitiesListPresenterLogic) {
        super.init(nibName: "CitiesListViewController", bundle: Bundle.main)
        self.presenter = presenter
        self.interactor = interactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CitiesListViewController: CitiesListDisplayLogic {
    func displayError(message: String) {
        //
    }
    
    func displayCities(viewModel: [CityViewModel]) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
