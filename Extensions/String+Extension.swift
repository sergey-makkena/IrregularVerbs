//
//  String+Extension.swift
//  Extensions
//
//  Created by Мустафаев Сергей Игоревич on 01.11.2020.
//

import Foundation

public extension String {

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
