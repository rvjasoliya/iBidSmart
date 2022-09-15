//
//  AddVehicleViewController.swift
//  iBid
//
//  Created by iMac on 21/12/20.
//  Copyright © 2020 RV. All rights reserved.
//

import UIKit

class AddVehicleViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collactionV: UICollectionView!
    @IBOutlet weak var collactionBackV: UIView!
    @IBOutlet weak var btnColete: UIButton!
    
    @IBOutlet weak var txtVINNo: UITextField!
    @IBOutlet weak var btnDecode: UIButton!
    @IBOutlet weak var btnScan: UIButton!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtMake: UITextField!
    @IBOutlet weak var txtModel: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    
    var list : [MarkStruct] = []
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        list.append(MarkStruct(angle: "Passenger side front angle", image: UIImage(named: "ic_car1")))
        list.append(MarkStruct(angle: "Driver side front angle", image: UIImage(named: "ic_car2")))
        list.append(MarkStruct(angle: "Driver side rear angle", image: UIImage(named: "ic_car3")))
        list.append(MarkStruct(angle: "Passenger side rear angle", image: UIImage(named: "ic_car4")))
        list.append(MarkStruct(angle: "Passenger front interior", image: UIImage(named: "ic_car5")))
        list.append(MarkStruct(angle: "Passenger rear interior", image: UIImage(named: "ic_car6")))
        list.append(MarkStruct(angle: "Open hood engine", image: UIImage(named: "ic_car7")))
        list.append(MarkStruct(angle: "Odometer", image: UIImage(named: "ic_car8")))
        list.append(MarkStruct(angle: "Interior", image: UIImage(named: "ic_car9")))
        list.append(MarkStruct(angle: "VIP", image: UIImage(named: "ic_car10")))
        list.append(MarkStruct(angle: "Additonal View", image: UIImage(named: "ic_car_add")))
        pageControl.numberOfPages = list.count
        self.pageControl.currentPage = 0
        self.view.bringSubviewToFront(self.pageControl)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .portrait }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(false)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        UIView.setAnimationsEnabled(true)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func decodeButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func scanButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func actionCompete(_ sender: Any) {
        
    }
    
    @IBAction func actionDecode(_ sender: Any) {
        
    }
    
    @IBAction func actionScan(_ sender: Any) {
        
    }
    
    
}

extension AddVehicleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell
        cell.lblAngle.text = list[indexPath.row].angle
        
       
        //cell.lblphotoNo.text = (indexPath.row == (list.count - 1)) ? "" : "\(indexPath.row+1)"
        cell.imgV.image = list[indexPath.row].image
        cell.imageButtonHandler = {
            self.openCamera()
        }
        
        
        self.pageControl.currentPage = self.pageControl.currentPage > indexPath.row ? indexPath.row + 1 : indexPath.row - 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = UIScreen.main.bounds.width
        let itemHeight = CGFloat(193)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension AddVehicleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func openCamera(){
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openPhotos(){
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
}


struct MarkStruct {
    var vinNo: String?
    var year: String?
    var make: String?
    var model: String?
    var color: String?
    var angle: String?
    var image: UIImage?
}
