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
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
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
    
    @IBAction func touchUpSave(_ sender: Any) {
        if let name = nameTextField.text,
           let age = ageTextField.text,
           let gender = genderTextField.text {
            let person = self.makeUserInfo(name, Int(age) ?? 0, gender)
            
            // 새로운 인스턴스 생성
            // update라는 애를 쓸 수 있는데 그건 id값이 있어야 한다.
            try! realmInstance.write {
                realmInstance.add(person)
            }
            self.label.text = "\(name)님 저장됐습니다!"
        }
    }
}

