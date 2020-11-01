//
//  DetailsVerbView.swift
//  Verbs
//
//  Created by Мустафаев Сергей Игоревич on 01.11.2020.
//

import UIKit
import Extensions

protocol DetailsVerbViewSpeechDelegate: class {
    func doTextToSpeech(text: String)
}

class DetailsVerbView: UIView {
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var mainLabel: UILabel!

    @IBOutlet private weak var form_1_Label: UILabel!
    @IBOutlet private weak var form_2_Label: UILabel!
    @IBOutlet private weak var form_3_Label: UILabel!

    @IBOutlet private weak var form_trans_1_Label: UILabel!
    @IBOutlet private weak var form_trans_2_Label: UILabel!
    @IBOutlet private weak var form_trans_3_Label: UILabel!

    @IBOutlet private weak var form_1_Button: UIButton!
    @IBOutlet private weak var form_2_Button: UIButton!
    @IBOutlet private weak var form_3_Button: UIButton!

    @IBOutlet private weak var subview_1: UIView!
    @IBOutlet private weak var subview_2: UIView!
    @IBOutlet private weak var subview_3: UIView!

    weak var delegate: DetailsVerbViewSpeechDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }

    private func customInit() {
        translatesAutoresizingMaskIntoConstraints = false

        contentView = loadViewFromNib()
        contentView.frame = bounds
        self.addSubview(contentView)

        contentView.backgroundColor = .white

        form_1_Button.addTarget(self, action: #selector(buttonsActions(sender:)), for: .touchUpInside)
        form_2_Button.addTarget(self, action: #selector(buttonsActions(sender:)), for: .touchUpInside)
        form_3_Button.addTarget(self, action: #selector(buttonsActions(sender:)), for: .touchUpInside)

        subview_1.layer.cornerRadius = 4
        subview_2.layer.cornerRadius = 4
        subview_3.layer.cornerRadius = 4

        let borderColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.3).cgColor
        let backgroundColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.25).cgColor

        subview_1.layer.borderColor = borderColor
        subview_2.layer.borderColor = borderColor
        subview_3.layer.borderColor = borderColor

        subview_1.layer.backgroundColor = backgroundColor
        subview_2.layer.backgroundColor = backgroundColor
        subview_3.layer.backgroundColor = backgroundColor

        subview_1.layer.borderWidth = 1.0
        subview_2.layer.borderWidth = 1.0
        subview_3.layer.borderWidth = 1.0

        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }

    func setTitle(text: String) {
        mainLabel.text = text.capitalizingFirstLetter()
    }

    func setForms(form_1: String, form_2: String, form_3: String) {
        form_1_Label.text = form_1
        form_2_Label.text = form_2
        form_3_Label.text = form_3
    }

    func setTranscriptionForms(form_1: String, form_2: String, form_3: String) {
        form_trans_1_Label.text = form_1
        form_trans_2_Label.text = form_2
        form_trans_3_Label.text = form_3
    }

    @IBAction private func buttonsActions(sender: UIButton) {
        switch sender {
        case form_1_Button:
            delegate?.doTextToSpeech(text: form_1_Label.text ?? "")
        case form_2_Button:
            delegate?.doTextToSpeech(text: form_2_Label.text ?? "")
        case form_3_Button:
            delegate?.doTextToSpeech(text: form_3_Label.text ?? "")
        default:
            break
        }
    }
}
