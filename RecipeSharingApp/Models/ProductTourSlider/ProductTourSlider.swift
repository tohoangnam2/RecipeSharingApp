//
//  ProductTourFirstSlider.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 8/5/25.
//

import UIKit

class ProductTourSlider: UISlider {


    let steps: [Float] = [1.0/3.0, 2.0/3.0, 1.0]

  
    var defaultStepIndex: Int = 0 {
        didSet {
            value = steps[defaultStepIndex]
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        minimumValue = 0.0
        maximumValue = 1.0
        value = steps[defaultStepIndex]
        isContinuous = true

        // Custom màu sắc
      self.minimumTrackTintColor = UIColor(hex: "#3FB4B1")
      self.maximumTrackTintColor = UIColor(hex: "#52BBB952")
        thumbTintColor = .systemBlue

        addTarget(self, action: #selector(snapToNearestStep), for: .touchUpInside)
        addTarget(self, action: #selector(snapToNearestStep), for: .touchUpOutside)
    }

    @objc func snapToNearestStep() {
        let nearestStep = steps.min(by: { abs($0 - value) < abs($1 - value) }) ?? 0.0
        setValue(nearestStep, animated: true)
        print("Snap về mức: \(nearestStep)")
    }

    func moveToNextStep() {
        guard let currentIndex = steps.firstIndex(of: steps.min(by: { abs($0 - value) < abs($1 - value) }) ?? 0.0) else { return }
        if currentIndex < steps.count - 1 {
            setValue(steps[currentIndex + 1], animated: true)
            print("Move to: \(currentIndex+2)/3")
        }
    }

    func moveToPreviousStep() {
        guard let currentIndex = steps.firstIndex(of: steps.min(by: { abs($0 - value) < abs($1 - value) }) ?? 0.0) else { return }
        if currentIndex > 0 {
            setValue(steps[currentIndex - 1], animated: true)
            print("Move to: \(currentIndex)/3")
        }
    }
}

