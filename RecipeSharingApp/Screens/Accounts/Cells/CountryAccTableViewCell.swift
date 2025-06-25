//
//  CountryAccTableViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 27/5/25.
//

import UIKit

class CountryAccTableViewCell: UITableViewCell {

  @IBOutlet weak var countryImage: UIImageView!
  
  @IBOutlet weak var countryLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func config(model: CountryAccModel){
    countryImage.image = model.countryImage
    countryLabel.text = model.countryLabel
 }


}
