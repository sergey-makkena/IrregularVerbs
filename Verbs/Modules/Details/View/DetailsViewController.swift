//
//  DetailsDetailsViewController.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 01/11/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput {

    var output: DetailsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: DetailsViewInput
    func setupInitialState() {
        view.backgroundColor = .white
    }
}
