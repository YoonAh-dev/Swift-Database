//
//  UserInfo.swift
//  Swift-Realm-Practice
//
//  Created by SHIN YOON AH on 2021/05/10.
//

import Foundation
import RealmSwift

class UserInfo: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var gender = ""
}
