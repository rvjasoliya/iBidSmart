//
//  UserDefaultsConstants.swift
//  T-Notebook_Client
//
//  Created by Apple on 28/04/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct UserDefaultParam {
    static let USERNAME = "USERNAME"
    static let PASSWORD = "PASSWORD"
    static let TOKEN = "TOKEN"
}

func saveToken(tk:String?){
    token = tk
    UserDefaults.standard.set(tk, forKey: UserDefaultParam.TOKEN)
}

func getToken(){
    token = UserDefaults.standard.string(forKey: UserDefaultParam.TOKEN)
}

func saveData(uName: String?, pass:String?){
    UserDefaults.standard.set(uName, forKey: UserDefaultParam.USERNAME)
    UserDefaults.standard.set(pass, forKey: UserDefaultParam.PASSWORD)
}

func retriveData(){
    userName = UserDefaults.standard.string(forKey: UserDefaultParam.USERNAME)
    password = UserDefaults.standard.string(forKey: UserDefaultParam.PASSWORD)
}

var userName:String?
var password:String?
var token:String?
