//
//  RegisterViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 12/5/25.
//

import UIKit

class RegisterViewController: UIViewController {
  @IBOutlet weak var registerEmailButton: UIButton!

  @IBOutlet weak var gmailBtn: UIButton!
  
  @IBOutlet weak var appleBtn: UIButton!
  

  override func viewDidLoad() {
        super.viewDidLoad()

//    [registerEmailButton,gmailBtn,appleBtn].forEach {
//      $0.layer.cornerRadius = 15
//      }


    }

  @IBAction func didTapRegister(_ sender: Any) {
    self.push(viewControllerType: HomeRegisterViewController.self)

  }
  
  @IBAction func didTapLogin(_ sender: Any) {
    self.push(viewControllerType: HomeRegisterViewController.self)
  }
  

}
