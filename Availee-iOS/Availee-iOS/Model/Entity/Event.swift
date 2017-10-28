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

}
