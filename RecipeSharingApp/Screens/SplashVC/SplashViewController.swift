//
//  SplashViewController.swift
//  RecipeSharingApp
//
//  Created by Phùng Anh Đài  on 6/5/25.
//

import UIKit
import Foundation

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      print("SplashViewController loaded!")
    }
  
  
  @IBAction func didTapProductour(_ sender: Any) {
    self.push(viewControllerType: ProductTourFirstViewController.self)

  }
  
  

}
