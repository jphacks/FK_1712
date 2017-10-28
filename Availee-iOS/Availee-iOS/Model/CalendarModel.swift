//
//  CalendarModel.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class CalendarModel: Object {
    var calendar :AvaileeCalendar?
    
    func calcAvailableSchedule(){
        // Events から 空いている時間を検索
    }
}
