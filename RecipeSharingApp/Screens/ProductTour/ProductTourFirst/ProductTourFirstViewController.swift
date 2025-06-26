//
//  ProductTourFirstViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 8/5/25.
//

import UIKit
import Foundation

class ProductTourFirstViewController: UIViewController {

  @IBOutlet weak var slider: ProductTourSlider!

  var panGesture: UIPanGestureRecognizer!


  override func viewDidLoad() {
    super.viewDidLoad()
    

    slider.defaultStepIndex = 0
    //an num slider di 
    slider.setThumbImage(UIImage(), for: .normal)


    // Thêm pan gesture vào view chứa slider hoặc view chính
    panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    view.addGestureRecognizer(panGesture)


    }

  override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }

  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
          let translation = gesture.translation(in: view)

          if gesture.state == .ended {
              // Vuốt sang phải
              if translation.x > 33 {
                  slider.moveToNextStep()

              }
              // Vuốt sang trái
              else if translation.x < -33 {
                  slider.moveToPreviousStep()
              }

            // Lấy giá trị slider sau khi vuốt xong
            let value = slider.value

            if value < 0.33 {
              self.push(viewControllerType: ProductTourFirstViewController.self)
            } else if value < 0.66 {
              self.push(viewControllerType: ProductTourSecondViewController.self)
            } else {
              self.push(viewControllerType: ProductTourThirdViewController.self)
            }

              gesture.setTranslation(.zero, in: view)
          }
      }
  

}
