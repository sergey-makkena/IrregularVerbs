//
//  MainMainPresenter.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 31/10/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

class MainPresenter {

    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}

extension MainPresenter: MainModuleInput { }

extension MainPresenter: MainInteractorOutput { }

extension MainPresenter: MainViewOutput {

    var listOfVerbs: [VerbEntity] {
        return interactor.listOfVerbs
    }

    func doSearch(text: String) -> [VerbEntity] {
        return interactor.doSearch(text: text)
    }

    func showDetails(verb: VerbEntity) {
        router.showDetails(verb: verb)
    }
}
