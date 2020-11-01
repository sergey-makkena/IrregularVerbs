//
//  MainMainViewController.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewOutput!
    
    private lazy var verbs: [VerbEntity] = {
        return presenter.listOfVerbs
    }()
    
    private var didSetupConstraints = false
    
    private lazy var resultsController = MainViewSearchResultsController()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: resultsController)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find a irregular verb"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.automaticallyShowsScopeBar = false
        searchController.searchBar.searchTextField.textColor = .black
        searchController.searchBar.searchTextField.tokenBackgroundColor = .red
        return searchController
    }()
    
    enum CellIdentifiers: String {
        case defaultCell = "MainViewResultsCell"
    }
    
    private lazy var tableView: UITableView = {
        var view = UITableView()
        view.register(UINib(nibName: CellIdentifiers.defaultCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiers.defaultCell.rawValue)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.estimatedRowHeight = 100.0
        //        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        navigationItem.searchController = searchController
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(tableView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        if (!didSetupConstraints) {
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
            
            didSetupConstraints = true
        }
    }
    
    func searchFor(_ searchText: String?) {
        guard searchController.isActive else { return }
        guard let searchText = searchText else {
            resultsController.results = nil
            return
        }
        
        resultsController.results = presenter.doSearch(text: searchText)
    }
    
}

// MARK: - MainViewInput
extension MainViewController: MainViewInput {
    func setupInitialState() {
        view.backgroundColor = .white
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verbs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainViewResultsCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultCell.rawValue, for: indexPath) as! MainViewResultsCell
        let entity = verbs[indexPath.row]
        cell.setText(titleText: entity.russian, descriptionText: entity.form_1 + " | " + entity.form_2 + " | " + entity.form_3)
        
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let searchText = searchController.searchBar.text else { return }
        searchFor(searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFor(searchText)
        //        let showScope = !searchText.isEmpty
        //        showScopeBar(showScope)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsController.results = nil
        //        showScopeBar(false)
        //        searchController.searchBar.searchTextField.backgroundColor = nil
    }
}


// MARK: - UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.searchTextField.isFirstResponder {
            searchController.showsSearchResultsController = true
            searchController.searchBar.searchTextField.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        } else {
            searchController.searchBar.searchTextField.backgroundColor = nil
        }
    }
}
