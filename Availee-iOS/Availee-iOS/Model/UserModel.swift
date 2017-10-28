//
//  UserModel.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel {
    var users : Results<User>?
    
    func userForId(user_id: Int) -> User? {
        let realm = try! Realm()
        let user = realm.object(ofType: User.self, forPrimaryKey: user_id)
        return user
    }
    
}
