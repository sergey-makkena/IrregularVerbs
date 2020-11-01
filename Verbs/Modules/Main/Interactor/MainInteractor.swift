//
//  MainMainInteractor.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import Foundation

class MainInteractor {
    
    weak var output: MainInteractorOutput!
    internal lazy var listOfVerbs = loadVerbsList()
}

private extension MainInteractor {
    func loadVerbsList() -> [VerbEntity] {
        guard let url = Bundle.main.url(forResource: "Verbs", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else {
                return []
        }
        
        do {
            let verbs = try JSONDecoder().decode([VerbEntity].self, from: data)
            return verbs
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}


// MARK: - MainInteractorInput
extension MainInteractor: MainInteractorInput {
    
    func doSearch(text: String) -> [VerbEntity] {
        let filteredVerbs = listOfVerbs.filter { (verb: VerbEntity) -> Bool in
            return verb.russian.lowercased().starts(with: text.lowercased()) ||
                verb.form_1.lowercased().starts(with: text.lowercased()) ||
                verb.form_2.lowercased().starts(with: text.lowercased()) ||
                verb.form_3.lowercased().starts(with: text.lowercased())
        }
        return filteredVerbs.count > 0 ? filteredVerbs : []
    }
}
