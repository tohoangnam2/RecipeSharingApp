//
//  TopChefCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import UIKit

class TopChefCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var topchefImage: UIImageView!
  
 
  @IBOutlet weak var nametopchefLabel: UILabel!

  @IBOutlet weak var timetopchefLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  func config(model : HomeModel){
    topchefImage.image = model.topchefImage
    nametopchefLabel.text = model.nametopchefLabel
    timetopchefLabel.text = model.timetopchefLabel
  }

}
