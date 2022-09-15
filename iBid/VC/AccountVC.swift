//
//  AccountVC.swift
//  iBid
//
//  Created by Rv on 16/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit
import SVProgressHUD

class AccountVC: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(false)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if urlTextField.text?.trimmingCharacters(in: .whitespaces).count == 0{
            toastMsg(vc: self, msg: "Please enter url.")
            return
        }
        if usernameTextField.text?.trimmingCharacters(in: .whitespaces).count == 0{
            toastMsg(vc: self, msg: "Please enter username.")
            return
        }
        if passwordTextField.text?.trimmingCharacters(in: .whitespaces).count == 0{
            toastMsg(vc: self, msg: "Please enter password.")
            return
        }
        let param = ["username": usernameTextField.text ?? "","password": passwordTextField.text ?? "", "url": urlTextField.text ?? ""] as [String : Any]
        showLoading(string: "Please wait")
        NetworkManager.tokenApi(param: param) { (status, final, error) in
                    if !status {
                        SVProgressHUD.dismiss()
                        if error == nil {
                        } else{
                            self.view!.makeToast(error?.localizedDescription, duration: 3.0, position: .bottom, style: style)
                        }
                    } else {
                        SVProgressHUD.dismiss()
                        self.view!.makeToast("Login Successfully", duration: 3.0, position: .bottom, style: style)
                        print(final ?? "")
                        saveToken(tk: final ?? "")
//                        if let userdata = final?.result {
//                            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: userdata)
//                            UserDefaults.standard.set(encodedData, forKey: "UserData")
//                            UserDefaults.standard.synchronize()
//                            userData = userdata
//                        }
                  
                    }
                }
//        saveData(uName: usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), pass: passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
}
