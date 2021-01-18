//
//  AppCoordinator.swift
//  CodeLatheTest
//
//  Created by Ravisankar on 18/01/21.
//

import UIKit

class AppCoordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let vc = SearchViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
