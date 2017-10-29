//
//  FreeTime.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/29.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
struct FreeTime: Codable{
    let startDate: String
    let endDate: String
    
    init(start: Date, end: Date) {
        let format = DateFormatter()
        format.timeStyle = .long
        format.locale = Locale(identifier: "ja_JP")
        self.startDate = format.string(from: start)
        self.endDate = format.string(from: end)
    }
}
