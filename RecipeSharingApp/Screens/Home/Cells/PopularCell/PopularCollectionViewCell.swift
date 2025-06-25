//
//  PopularCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var bgppImage: UIImageView!
  
  @IBOutlet weak var timeppLabel: UILabel!
  
  @IBOutlet weak var ingredientsppLabel: UILabel!

  @IBOutlet weak var favoriteButton: UIButton!
  
  @IBOutlet weak var contentLabel: UILabel!
  var isCheck = false

  @IBOutlet weak var contentppLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    isCheck = false
    favoriteButton.setImage(UIImage(resource: .favorite), for: .normal)

    }
  
  @IBAction func didTapChange(_ sender: Any) {
    isCheck.toggle()
    if isCheck{
      favoriteButton.setImage(UIImage(resource: .favortiteFill), for: .normal)
    }
    else{
      favoriteButton.setImage(UIImage(resource: .favorite), for: .normal)

    }

  }
  func config(model:HomeModel){
    bgppImage.image = model.bgppImage
    timeppLabel.text = model.timeppLabel
    ingredientsppLabel.text = model.ingredientsppLabel
    contentLabel.text = model.contentppLabel
  }

}
