//
//  InventoryTableViewCell.swift
//  iBid
//
//  Created by iMac on 21/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class InventoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var typeLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var backView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
