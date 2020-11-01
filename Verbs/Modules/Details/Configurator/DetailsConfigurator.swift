//
//  DetailsDetailsConfigurator.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 01/11/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

class DetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailsViewController) {

        let router = DetailsRouter()

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        router.viewController = viewController
        
        let interactor = DetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
