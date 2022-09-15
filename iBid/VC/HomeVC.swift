//
//  HomeVC.swift
//  iBid
//
//  Created by Rv on 16/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(false)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
        if token == nil{
            ToastAlertController(Message: "Please login to continue.", alertMsg: "")
            //toastMsg(vc: self, msg: "Please login to continue.")
            self.tabBarController?.selectedIndex = 4
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if token == nil{
//            self.tabBarController?.selectedIndex = 4
//            ToastAlertController(Message: "Please login to continue.", alertMsg: "")
//        }
//    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVehicleViewController") as! AddVehicleViewController
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    @IBAction func inventoryButtonAction(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func scanButtonAction(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 2
    }
}
