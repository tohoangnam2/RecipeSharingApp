//
//  SetupAccViewViewController.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 28/5/25.
//

import UIKit

class SetupAccViewViewController: UIViewController {

  @IBOutlet weak var setupLabel: UILabel!

  @IBOutlet weak var setupChangeImage: UIImageView!

  var isChange = false


  override func viewDidLoad() {
    super.viewDidLoad()
    setupChangeImage.image = UIImage(resource: .setupVeg)

  }

  @IBAction func didBackCountryAcc(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)

  }


  @IBAction func didTapDetails(_ sender: Any) {
    if isChange == true {
            // Nếu đã đổi ảnh, bây giờ chuyển sang màn tiếp theo
            self.push(viewControllerType: SetupDatailViewController.self)
        } else {
            // Chưa đổi, thì đổi ảnh và hiện label
          setupChangeImage.image = UIImage(resource: .setupNoodel)
            setupLabel.isHidden = false
            isChange = true
        }

  }


  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */

}
