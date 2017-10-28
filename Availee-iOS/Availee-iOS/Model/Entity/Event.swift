//
//  Event.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var start_date = Date()
    @objc dynamic var end_date = Date()
    @objc dynamic var isFixed = false
    
    convenience init(title: String, start_date: Date, end_date: Date, isFixed: Bool) {
        self.init()
        self.id = UUID.init().uuidString
        self.title = title
        self.start_date  = start_date
        self.end_date = end_date
        self.isFixed = isFixed
    }

}
