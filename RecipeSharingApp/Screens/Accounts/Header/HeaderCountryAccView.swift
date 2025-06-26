//
//  HeaderCountryAccView.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 27/5/25.
//

import UIKit

import UIKit

class HeaderCountryAccView :UIView{
    override init(frame: CGRect) {
            super.init(frame: frame)
        setupView()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }

    private func setupView() {
                  guard let view = loadViewFromNib() else { return }
                  view.frame = bounds
                  view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                  addSubview(view)
              }

        private func loadViewFromNib() -> UIView? {
            let nibName = "HeaderCountryAccView" // tên file XIB
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
}
