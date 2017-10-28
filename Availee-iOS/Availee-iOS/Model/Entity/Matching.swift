//
//  Matching.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class Matching: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var user_id = 0
    @objc dynamic var start_date = Date()
    @objc dynamic var end_date = Date()
    @objc dynamic var isDate = false

    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: Int, user_id: Int, start_date: Date, end_date: Date, isDate: Bool) {
        self.init()
        self.id = id
        self.user_id = user_id
        self.start_date = start_date
        self.end_date = end_date
        self.isDate = isDate
    }
}
