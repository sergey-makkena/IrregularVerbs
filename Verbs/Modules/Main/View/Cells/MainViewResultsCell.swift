//
//  MainViewResultsCell.swift
//  Verbs
//
//  Created by Мустафаев Сергей Игоревич on 31.10.2020.
//

import UIKit
import DevExtensions

class MainViewResultsCell: UITableViewCell {

    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var form_1_Label: UILabel!
    @IBOutlet private weak var form_2_Label: UILabel!
    @IBOutlet private weak var form_3_Label: UILabel!
    @IBOutlet private weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }

    override func prepareForReuse() {
        mainLabel.text = ""
        form_1_Label.text = ""
        form_2_Label.text = ""
        form_3_Label.text = ""
    }

    private func customize() {
        bgView.layer.cornerRadius = 4

        let borderColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.3).cgColor
        let backgroundColor = UIColor.init(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.25).cgColor

        bgView.layer.backgroundColor = backgroundColor
        bgView.layer.borderColor = borderColor
        bgView.layer.borderWidth = 1.0

        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }

    func setText(titleText: String, form_1: String, form_2: String, form_3: String) {
        mainLabel.text = titleText.capitalizingFirstLetter()
        form_1_Label.text = "I  : " + form_1
        form_2_Label.text = "II : " + form_2
        form_3_Label.text = "III: " + form_3
    }
}
