//
//  InventoryVC.swift
//  iBid
//
//  Created by Rv on 16/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class InventoryVC: UIViewController {
    
    
    
    var carList:[InventoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carList.append(InventoryModel(title: "2020 MG", type: "450 MATIC", price: "$65200", image: UIImage(named: "1")))
        carList.append(InventoryModel(title: "2017 BMW", type: "5301 M Sport", price: "$6000", image: UIImage(named: "2")))
        carList.append(InventoryModel(title: "2014 Benz", type: "Super 2.0 Turbo", price: "$55200", image: UIImage(named: "4")))
        carList.append(InventoryModel(title: "2017 Mercedes", type: "5301 M Sport", price: "$32200", image: UIImage(named: "1")))
        carList.append(InventoryModel(title: "2020 Suzuki", type: "450 MATIC", price: "$12200", image: UIImage(named: "3")))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if token == nil{
            self.tabBarController?.selectedIndex = 4
            ToastAlertController(Message: "Please login to continue.", alertMsg: "")
        }
    }
    
}

extension InventoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryTableViewCell") as! InventoryTableViewCell
        let carPath = carList[indexPath.row]
        cell.backView.cornerRadius = 8
        cell.carImageView.image = carPath.image
        cell.titleLabel.text = carPath.title
        cell.typeLabel.text = carPath.type
        cell.priceLabel.text = carPath.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVehicleViewController") as! AddVehicleViewController
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}
