//
//  MainMainInteractorInput.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import Foundation

protocol MainInteractorInput {
    var listOfVerbs: [VerbEntity] { get }
    func doSearch(text: String) -> [VerbEntity]
}
