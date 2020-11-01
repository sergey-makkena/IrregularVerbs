//
//  MainMainRouter.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

class MainRouter :BaseRouter {

}

extension MainRouter: MainRouterInput {
    func showDetails() {
        let initializer = DetailsModuleInitializer()
        viewController?.present(initializer.detailsViewController, animated: true, completion: nil)
        print("Show Details")
    }
}
