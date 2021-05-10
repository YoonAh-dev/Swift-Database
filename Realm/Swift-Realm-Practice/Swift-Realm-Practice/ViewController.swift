//
//  ViewController.swift
//  Swift-Realm-Practice
//
//  Created by SHIN YOON AH on 2021/05/10.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    // Get the default Realm
    let realmInstance = try! Realm()
    // You only need to do this once (per thread)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func makeUserInfo(_ name: String,_ age: Int,_ gender: String) -> UserInfo {
        let userInfo = UserInfo()
        userInfo.name = name
        userInfo.age = age
        userInfo.gender = gender
        
        return userInfo
    }
}

