//
//  CalendarPost.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/29.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class CalendarPost {
    var userId: Int
    var freeTime: [FreeTime] = []
    var freeDate: [FreeDate] = []
    
    var dates:[Date] = []

    
    var morningTime: Date = Date()
    var nightTime: Date = Date()
    
    func initDate(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "HH:mm"
        morningTime = dateFormat.date(from: "07:00")!
        nightTime = dateFormat.date(from: "23:00")!
    }
    
    init(events: Results<Event>) {
        let userdefaults = UserDefaults.standard
        if let id = userdefaults.value(forKey: "id") as? Int{
            self.userId = id
        }
        self.userId = 0
        
        for eve in 0..<(events.count - 1) {
            let diff = events[eve + 1].start_date.timeIntervalSince(events[eve].end_date)
            if diff > 60*24*7 {
                freeDate.append( FreeDate(start: events[eve].end_date, end: events[eve + 1].start_date) )
            }
        }
        
    }
}
