//
//  DetailsDetailsInitializer.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 01/11/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

class DetailsModuleInitializer: NSObject {

    var detailsViewController: DetailsViewController!

    required override init() {
        detailsViewController = DetailsViewController()
        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailsViewController)
    }
}
