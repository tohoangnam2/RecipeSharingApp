//
//  LiveCollectionViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 2/6/25.
//

import UIKit
import Foundation

protocol LiveCollectionViewCellDelegate : AnyObject{
  func a()

}

class LiveCollectionViewCell: UICollectionViewCell {


  weak var delegate : LiveCollectionViewCellDelegate?

  @IBOutlet weak var liveBGImage: UIImageView!
  @IBOutlet weak var liveImage: UIImageView!
  
  @IBOutlet weak var liveLabel: UILabel!
  
  @IBOutlet weak var liveView: UIView!

  var onTapLiveStream: (() -> Void)?

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  func config(model:HomeModel){
    liveImage.image = model.liveImage
    liveLabel.text = model.liveLabel
    liveBGImage.image = model.liveBGImage
  }
  @IBAction func didTapLiveTream(_ sender: Any) {
//    onTapLiveStream?()
    delegate?.a()
  }
}
