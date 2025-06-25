//
//  GalleriersCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 20/6/25.
//

import UIKit

class GalleriersCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var galleriersImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func config(model:HomeModel){
    galleriersImage.image = model.galleriersImage
  }
}
