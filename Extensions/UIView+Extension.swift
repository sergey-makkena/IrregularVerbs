//
//  UIView+Extension.swift
//  Extensions
//
//  Created by Мустафаев Сергей Игоревич on 01.11.2020.
//

import UIKit

public extension UIView {
    
    func loadViewFromNib() -> UIView {
        let name = String(describing: type(of: self))
        let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }
    
}
