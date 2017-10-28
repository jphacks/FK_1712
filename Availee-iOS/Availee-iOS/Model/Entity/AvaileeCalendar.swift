//
//  Calendar.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class AvaileeCalendar: Object {
    @objc dynamic var id = 0
    let fixedEvents = List<Event>()
    let myEvents = List<Event>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
