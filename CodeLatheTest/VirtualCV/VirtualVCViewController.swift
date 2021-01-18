//
//  VirtualVCViewController.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import Foundation
import UIKit

typealias SkillsCellConfigurator = TableCellConfigurator<CVSkillsCell, [String]>
typealias SummaryCellConfigurator = TableCellConfigurator<CVSummaryCell, String>
typealias ImageCellConfigurator = TableCellConfigurator<CVGalleryCell, [String]>
typealias ProfileCellConfigurator = TableCellConfigurator<CVProfileCell, UserProfile>

final class VirtualCVViewController: UIViewController {
    
    // This view can reeive the cv from some source (api/ file) and can have a view model which handles that part with the necessary mapping of models which can then be tested as well. Due to time constraint I am adding it here.
    var items: [CellConfigurator] = [ProfileCellConfigurator(item: UserProfile(name: "John Doe", phone: "12345667", email: "test@test.com", profileImage: "oval")),
    SkillsCellConfigurator(item: ["HTML", "CSS", "Javascript"]),
    SummaryCellConfigurator(item: "\"John Doe\" and \"Jane Doe\" (for females) are multiple-use names that are used when the true name of a person is unknown or is being intentionally concealed. In the context of law enforcement in the United States, such names are often used to refer to a corpse whose identity is unknown or unconfirmed. Secondly, such names are also often used to refer to a hypothetical \"everyman\" in other contexts, in a manner similar to \"John Q. Public\" or \"Joe Public\". There are many variants to the above names, including \"John Roe\", \"Richard Roe\", \"Jane Roe\" and \"Baby Doe\", \"Janie Doe\" or \"Johnny Doe\" (for children)."),
    ImageCellConfigurator(item: ["Vector (1)", "Vector (2)", "Vector (3)", "Vector (4)"])]
    
    var reuseIdentifiers: Set<String> = []
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCell(type: CVSummaryCell.self)
        tableView.register(UINib(nibName: "CVGalleryCell", bundle: nil), forCellReuseIdentifier: "CVGalleryCell")
        tableView.register(UINib(nibName: "CVProfileCell", bundle: nil), forCellReuseIdentifier: "CVProfileCell")
        tableView.register(UINib(nibName: "CVSkillsCell", bundle: nil), forCellReuseIdentifier: "CVSkillsCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        
        title = "John Doe's CV"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension VirtualCVViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        
        return cell
    }
}

extension VirtualCVViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        /// Height calculation can be further improved by making it part of cell configurator
        if let item = items[safe: indexPath.row] ,
           item is ImageCellConfigurator {
            return 138
        }
        
        return UITableView.automaticDimension
    }
}
