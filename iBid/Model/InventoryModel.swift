//
//  InventoryModel.swift
//  iBid
//
//  Created by iMac on 21/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class InventoryModel{
    var title:String?
    var type:String?
    var price:String?
    var image:UIImage?
    
    init(title: String?, type: String?, price: String?, image: UIImage?) {
        self.title = title
        self.type = type
        self.price = price
        self.image = image
    }
}
