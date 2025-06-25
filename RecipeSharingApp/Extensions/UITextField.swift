//
//  UITextField.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 29/5/25.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholder(_ text: String) {
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
}
