//
//  DetailsDetailsViewInput.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 01/11/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

protocol DetailsViewInput: class {
    func setupInitialState()
    func setVerb(_ verb: VerbEntity)
}
