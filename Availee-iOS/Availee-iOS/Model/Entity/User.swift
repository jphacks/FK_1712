//
//  User.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var icon = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}

