//
//  ProductTourFirstViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 8/5/25.
//

import UIKit
import Foundation

class ProductTourThirdViewController: UIViewController {

  

  @IBOutlet weak var slider3: ProductTourSlider!

  var panGesture: UIPanGestureRecognizer!


  override func viewDidLoad() {
    super.viewDidLoad()


    slider3.defaultStepIndex = 2
    //an num slider di
    slider3.setThumbImage(UIImage(), for: .normal)


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
          // Vuốt sang phải (quay về màn 2)
          if translation.x > 33 {
              slider3.moveToPreviousStep()
              self.push(viewControllerType: ProductTourSecondViewController.self)
          }

          // Vuốt sang trái (ở màn 3 thì không đi tiếp)
          else if translation.x < -30 {
            //nhay man khac neu can
            slider3.moveToNextStep()
            self.push(viewControllerType: RegisterViewController.self)
          }

          gesture.setTranslation(.zero, in: view)
      }
  }



}
