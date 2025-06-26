//
//  SetupViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 30/5/25.
//

import UIKit

class SetupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }

  
  @IBAction func didtapHome(_ sender: Any) {
    self.push(viewControllerType: HomeViewController.self)

  }
}
