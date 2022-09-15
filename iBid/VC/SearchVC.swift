//
//  SearchVC.swift
//  iBid
//
//  Created by Rv on 16/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if token == nil{
            self.tabBarController?.selectedIndex = 4
            ToastAlertController(Message: "Please login to continue.", alertMsg: "")
        }
    }
    
}
