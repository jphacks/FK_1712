//
//  MatchingModel.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift

class MatchingModel {
    var matchings: Results<Matching>?
    
    init(user_id: Int?) {
        var matchings :Results<Matching>?
        let realm = try! Realm()
        if let user_id = user_id {
            matchings = realm.objects(Matching.self).filter("user_id == %@", user_id)
        }else {
            matchings = realm.objects(Matching.self)
        }
//        matchings = matchings?.filter("start_date >= %@", Date())
        matchings = matchings?.sorted(byKeyPath: "start_date", ascending: true)
        self.matchings = matchings
    }
    
}
