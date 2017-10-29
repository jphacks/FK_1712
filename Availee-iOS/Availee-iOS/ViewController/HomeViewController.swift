//
//  HomeViewController.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let model = MatchingModel(user_id: nil)
    let userModel = UserModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        
        let calendar = Calendar.current
        let fourHoursAfter = calendar.date(byAdding: .hour, value: 4, to: Date())
        let twoDaysAfter = calendar.date(byAdding: .day, value: 2, to: Date())
        
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(User(id: 1, name: "石原さとみ", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/918726d10a5c597eff7d936099f837991.jpg"), update: true)
            realm.add(User(id: 2, name: "玉木宏", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/スクリーンショット 2017-10-24 10.58.38@3x.png") ,update: true)
            realm.add(User(id: 3, name: "前川和真", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/スクリーンショット 2017-10-24 10.59.19@3x.png"), update: true)
            realm.add(User(id: 4, name: "ばらい", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/スクリーンショット 2017-10-24 11.11.35@3x.png"), update: true)
            realm.add(User(id: 5, name: "きんまる", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/スクリーンショット 2017-10-24 11.14.08@3x.png"), update: true)
            realm.add(User(id: 6, name: "じょりー", icon: "/Users/jolie/workspace/jphacks/FK_1712/Availee-iOS/Availee-iOS/Utility/スクリーンショット 2017-10-24 11.16.10@3x.png"), update: true)

            realm.add(Matching(id: 1, user_id: 1, start_date: Date(), end_date: fourHoursAfter!, isDate: false), update: true)
            realm.add(Matching(id: 2, user_id: 2, start_date: Date(), end_date: twoDaysAfter!, isDate: true), update: true)
            realm.add(Matching(id: 3, user_id: 3, start_date: Date(), end_date: fourHoursAfter!, isDate: false), update: true)
            realm.add(Matching(id: 4, user_id: 4, start_date: Date(), end_date: twoDaysAfter!, isDate: true), update: true)
            realm.add(Matching(id: 5, user_id: 5, start_date: Date(), end_date: fourHoursAfter!, isDate: false), update: true)
            realm.add(Matching(id: 6, user_id: 6, start_date: Date(), end_date: twoDaysAfter!, isDate: true), update: true)

        }
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matching", for: indexPath) as! MatchingTableViewCell
        let dateFormatter = DateFormatter()

        guard let matchings = model.matchings else {
            return cell
        }
        //dateintervalの計算
        func getIntervalDays(date:Date, anotherDay:Date) -> Int {
            var retInterval:Double!
            let format = DateFormatter()
            format.dateFormat = "MM/dd"
            let daysString:(String, String) = (format.string(from: date) , format.string(from: anotherDay))
            let dates: (Date, Date) = (format.date(from: daysString.0)!, format.date(from: daysString.1)!)
            
            retInterval = dates.0.timeIntervalSince(dates.1)
            let ret = (retInterval/86400) + 1
            return Int(floor(ret))
        }
        //timeintervalの計算
        func getIntervalTimes(date:Date, anotherDay:Date) -> Int {
            var retInterval:Double!
            let format = DateFormatter()
            format.dateFormat = "HH:mm"
            let daysString:(String, String) = (format.string(from: date) , format.string(from: anotherDay))
            let dates: (Date, Date) = (format.date(from: daysString.0)!, format.date(from: daysString.1)!)
            
            retInterval = dates.0.timeIntervalSince(dates.1)
            let ret = retInterval/3600
            return Int(floor(ret))
        }
        
//        DateFormatterをつかう
        if matchings[indexPath.row].isDate {
            dateFormatter.dateFormat = "MM/dd(EEE)"
            let start_str = dateFormatter.string(from: matchings[indexPath.row].start_date)
            let end_str = dateFormatter.string(from: matchings[indexPath.row].end_date)
            cell.dateLabel.text = start_str + " - " + end_str

            cell.termLabel.text = "\(getIntervalDays(date: matchings[indexPath.row].end_date, anotherDay: matchings[indexPath.row].start_date)) days"
            
        } else {
            dateFormatter.dateFormat = "MM/dd(EEE)"
            let start_str = dateFormatter.string(from: matchings[indexPath.row].start_date)
            cell.dateLabel.text = start_str

            dateFormatter.dateFormat = "HH:mm"
            let start_term = dateFormatter.string(from: matchings[indexPath.row].start_date)
            let end_term = dateFormatter.string(from: matchings[indexPath.row].end_date)
            cell.termLabel.text = start_term + " - " + end_term + " (\(getIntervalTimes(date: matchings[indexPath.row].end_date, anotherDay: matchings[indexPath.row].start_date))h)"
        }
        
        let user = userModel.userForId(user_id: matchings[indexPath.row].user_id)
        
        cell.userNameLabel.text = user?.name
        cell.iconImageView.image = UIImage(named: (user?.icon)!) 
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.matchings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
