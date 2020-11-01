//
//  DetailsDetailsViewController.swift
//  Verbs
//
//  Created by Sergey Mustafaev on 01/11/2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit
import AVFoundation

class DetailsViewController: UIViewController {
    var output: DetailsViewOutput!

    private var didSetupConstraints = false
    private var verb: VerbEntity?
    private lazy var speechSynthesizer = AVSpeechSynthesizer()

    private lazy var detailsView: DetailsVerbView = {
        let view = DetailsVerbView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: DetailsViewInput
    func setupInitialState() {
        view.backgroundColor = .white
    }

    override func loadView() {
        super.loadView()

        view.addSubview(detailsView)
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        if (!didSetupConstraints) {
            NSLayoutConstraint.activate([
                detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                detailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                detailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                detailsView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            ])

            didSetupConstraints = true
        }
    }
}

// MARK: - DetailsViewInput
extension DetailsViewController: DetailsViewInput {

    func setVerb(_ verb: VerbEntity) {
        self.verb = verb

        detailsView.setTitle(text: verb.russian)

        detailsView.setForms(form_1: verb.form_1,
                             form_2: verb.form_2,
                             form_3: verb.form_3)

        detailsView.setTranscriptionForms(form_1: verb.form_1_trans,
                                          form_2: verb.form_2_trans,
                                          form_3: verb.form_3_trans)
    }
}

// MARK: - DetailsVerbViewSpeechDelegate
extension DetailsViewController: DetailsVerbViewSpeechDelegate {
    func doTextToSpeech(text: String) {

        speechSynthesizer.stopSpeaking(at: .immediate)
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 4.0
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        speechSynthesizer.speak(speechUtterance)
    }
}
