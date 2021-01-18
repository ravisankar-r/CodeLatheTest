//
//  SearchViewController.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit
import RxSwift

final class SearchViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?

    var cities: [City] = [] {
        didSet {
            searchResultTableView.reloadData()
        }
    }
    
    private lazy var searchResultTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(type: CityCell.self)
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var searchButton: UIButton = {
      
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var userProfileButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(systemName: "person"), for: .normal)
        return button
    }()
    
    private lazy var searchField: UITextField = {
      
        let text = UITextField()
        text.placeholder = "Search Cities"
        text.isUserInteractionEnabled = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var seperatorView: UIView = {
      
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        view.backgroundColor = UIColor(red: 0.73, green: 0.75, blue: 0.79, alpha: 1.00)
        return view
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        setupBindings()
    }
    
    private func configView() {
        
        title = "Search"
        view.backgroundColor = .white
        let barButtonItem = UIBarButtonItem(customView: userProfileButton)
        navigationItem.setRightBarButton(barButtonItem, animated: true)
        view.addSubview(searchResultTableView)
        view.addSubview(searchField)
        view.addSubview(searchButton)
        view.addSubview(seperatorView)
        
        searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        searchResultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchResultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 12).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        searchButton.centerYAnchor.constraint(equalTo: searchField.centerYAnchor).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        seperatorView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10).isActive = true
        searchResultTableView.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 14).isActive = true
        searchResultTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
       userProfileButton.addTarget(self, action: #selector(userProfileTapped), for: .touchUpInside)
    }
    
    @objc func userProfileTapped() {
        
        coordinator?.profileAction()
    }
    
    func setupBindings() {

        let viewModel = SearchResultViewModel(searchString: searchField.rx.text.asObservable(),
                                              didPressButton: searchButton.rx.tap.asObservable())
        viewModel.cities.drive(onNext: { [unowned self] cities in

            self.cities = cities
        }).disposed(by: disposeBag)
    }
}

// MARK: - Table view data source

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityCell = tableView.dequeueResuableCell(forIndexPath: indexPath)
        guard let city = cities[safe: indexPath.row] else {
            preconditionFailure()
        }
        cell.config(city: city)
        return cell
    }
}
