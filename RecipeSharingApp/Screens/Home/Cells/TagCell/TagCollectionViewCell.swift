//
//  TagCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var tagImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func config(model: HomeModel){
    tagImage.image = model.tagImage
  }

}
