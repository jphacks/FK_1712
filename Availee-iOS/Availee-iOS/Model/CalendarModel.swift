//
//  CalendarModel.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import Foundation
import RealmSwift
import EventKit

class CalendarModel {
    var events: Results<Event>?
    var allStartDates: [Date]?
    
    private let eventStore = EKEventStore()
    
    init() {
        let realm = try! Realm()
        self.events = realm.objects(Event.self)
        
    }
    
    func calcAvailableSchedule(){
        // Events から 空いている時間を検索
        
        
    }
    
    func readEventsFromAppleCalendar(completion:() -> Void ){
        let realm = try! Realm()
        try! realm.write {
            if let events = self.events {
                realm.delete(events)
            }
        }
        
        allowAuthorization()
        
        let calendar = Calendar.current
        let comps = calendar.dateComponents([.year, .month], from: Date())
        let firstday = calendar.date(from: comps)
        let add = DateComponents(month: 2, day: -1)
        let nextMonthLastDay = calendar.date(byAdding: add, to: firstday!)
        
        let events = getEventsFromAppleCalendar(startDate: firstday!, endDate: nextMonthLastDay!)
        
        try! realm.write {
            _ = events.map{ realm.add($0) }
        }
        allStartDates = events.map({ (event) -> Date in
            event.start_date
        })
        completion()
    }
    
    
    private func allowAuthorization() {
        if getAuthorization_status() {
            return
        } else {
            eventStore.requestAccess(to: .event, completion: {
                (granted, error) in
                if granted {
                    return
                } else {
                    print("Not allowed")
                }
            })
        }
    }
    
    private func getAuthorization_status() -> Bool {
        let status = EKEventStore.authorizationStatus(for: .event)
        switch status {
        case .notDetermined:
            print("NotDetermined")
            return false
        case .denied:
            print("Denied")
            return false
        case .authorized:
            print("Authorized")
            return true
        case .restricted:
            print("Restricted")
            return false
        }
    }
    
    func getEventsFromAppleCalendar (startDate: Date, endDate: Date) -> [Event] {
//        let calendars = eventStore.calendars(for: EKEntityType.event)
        let calendars = eventStore.defaultCalendarForNewEvents
        guard let cal = calendars else { return [] }
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: [cal])
        let events = eventStore.events(matching: predicate)
        
        return events.map { (event) -> Event in
            return Event(title: event.title, start_date: event.startDate, end_date: event.endDate, isFixed: false)
        }
    }
    
    
    
}
