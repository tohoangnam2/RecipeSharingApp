//
//  LiveCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import UIKit

class LiveCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var liveBGImage: UIImageView!
  @IBOutlet weak var liveImage: UIImageView!
  
  @IBOutlet weak var liveLabel: UILabel!
  
  @IBOutlet weak var liveView: UIView!

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  func config(model:HomeModel){
    liveImage.image = model.liveImage
    liveLabel.text = model.liveLabel
    liveBGImage.image = model.liveBGImage
  }
}
