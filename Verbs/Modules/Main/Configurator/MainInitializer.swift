//
//  MainMainInitializer.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

class MainModuleInitializer: NSObject {

    var mainViewController: MainViewController!

    required override init() {
        mainViewController = MainViewController()
        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainViewController)
    }
}
