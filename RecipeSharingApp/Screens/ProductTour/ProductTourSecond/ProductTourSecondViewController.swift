//
//  ProductTourFirstViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 8/5/25.
//

import UIKit
import Foundation

class ProductTourSecondViewController: UIViewController {

  @IBOutlet weak var slider2: ProductTourSlider!
  
  var panGesture: UIPanGestureRecognizer!


  override func viewDidLoad() {
    super.viewDidLoad()


    slider2.defaultStepIndex = 1
    //an num slider di
    slider2.setThumbImage(UIImage(), for: .normal)


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
          if translation.x > 33 {
              // Vuốt sang phải → về màn 1
              self.push(viewControllerType: ProductTourFirstViewController.self)
          } else if translation.x < -33 {
              // Vuốt sang trái → sang màn 3
              self.push(viewControllerType: ProductTourThirdViewController.self)
          }

          gesture.setTranslation(.zero, in: view)
      }
  }


}
