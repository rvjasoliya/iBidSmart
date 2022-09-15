//
//  itemCell.swift
//  iBid
//
//  Created by Rv on 16/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class itemCell: UICollectionViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lblAngle: UILabel!
    
    var imageButtonHandler:(() -> ())!
    
    @IBAction func addImageButtonAction(_ sender: UIButton){
        imageButtonHandler()
    }
  
}
