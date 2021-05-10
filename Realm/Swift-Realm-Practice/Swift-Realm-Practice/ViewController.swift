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
    
    @IBAction func touchUpRead(_ sender: Any) {
        // UserInfo Data들을 가져옴
        let person = realmInstance.objects(UserInfo.self)
        var personsName = String()
        
        for i in 0..<person.count {
            personsName += "\(person[i].name)\n"
            self.label.text = personsName
        }
    }
    
    @IBAction func touchUpUpdate(_ sender: Any) {
        // %@ 자체가 Objective-C적 notation 같습니다.
        // %d하거나 %f하는 것과 동일
        // 같은 이름인 첫번째 사람을 가져와서 update시키는 듯
        if let userInfo = realmInstance.objects(UserInfo.self).filter(NSPredicate(format: "name = %@", nameTextField.text ?? "No Person")).first {
                try! realmInstance.write {
                    userInfo.name = "현빈"
                    userInfo.age = 38
                    userInfo.gender = "Male"
                }
            
            self.label.text = "\(nameTextField.text!)가 현빈으로 변경되었습니다."
        } else {
            self.label.text = "없습니다! 제대로 넣어주세요!"
        }
    }
    
    @IBAction func touchUpDelete(_ sender: Any) {
        if let userInfo = realmInstance.objects(UserInfo.self).filter(NSPredicate(format: "name = %@", nameTextField.text ?? "No Person")).first {
                try! realmInstance.write {
                    realmInstance.delete(userInfo)
                }
            
            self.label.text = "삭제되었습니다."
        } else {
            self.label.text = "없는 사람입니다."
        }
    }
}

