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
    @IBOutlet private weak var resultsLabel: UILabel!
    @IBOutlet private weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }

    override func prepareForReuse() {
        mainLabel.text = ""
        resultsLabel.text = ""
    }

    private func customize() {
        
    }

    func setText(titleText: String, descriptionText: String) {
        mainLabel.text = titleText.capitalizingFirstLetter()
        resultsLabel.text = descriptionText
    }
}
