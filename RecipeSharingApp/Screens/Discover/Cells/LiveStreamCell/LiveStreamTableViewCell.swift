//
//  LiveStreamTableViewCell.swift
//  RecipeSharingApp
//
//  Created by to hoang nam on 26/6/25.
//

import UIKit

class LiveStreamTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var chatLabel: UILabel!

  var onSendMessage: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
