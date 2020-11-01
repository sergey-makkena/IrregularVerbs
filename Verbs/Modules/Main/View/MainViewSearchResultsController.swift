//
//  MainViewSearchResultsController.swift
//  Verbs
//
//  Created by Мустафаев Сергей Игоревич on 31.10.2020.
//

import UIKit

protocol ResultsTableViewDelegate: class {
    func didSelect(token: String)
}

class MainViewSearchResultsController: UIViewController {
    private var didSetupConstraints = false
    weak var delegate: ResultsTableViewDelegate?
    
    var results: [VerbEntity]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private enum CellIdentifiers: String {
        case defaultCell = "MainViewResultsCell"
    }
    
    private lazy var tableView: UITableView = {
        var view = UITableView()
        view.register(UINib(nibName: CellIdentifiers.defaultCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiers.defaultCell.rawValue)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.estimatedRowHeight = 100.0
        view.separatorStyle = .none
        view.rowHeight = UITableView.automaticDimension
        view.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.showsVerticalScrollIndicator = true
        
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
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
}

// MARK: - UITableViewDelegate
extension MainViewSearchResultsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension MainViewSearchResultsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return defaultCell(tableView, cellForRowAt: indexPath)
    }
    
    func defaultCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MainViewResultsCell {
        let cell: MainViewResultsCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.defaultCell.rawValue, for: indexPath) as! MainViewResultsCell
        if let entity = results?[indexPath.row] {
            cell.setText(titleText: entity.russian, descriptionText: entity.form_1 + " | " + entity.form_2 + " | " + entity.form_3)
        }
        return cell
    }
}
