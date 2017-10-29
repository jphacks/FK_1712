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
        
//        
//        let calendar = Calendar.current
//        let fourHoursAfter = calendar.date(byAdding: .hour, value: 4, to: Date())
//        let twoDaysAfter = calendar.date(byAdding: .day, value: 2, to: Date())
//        
//        
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(User(id: 1, name: "Jolie", icon: ""))
//            realm.add(User(id: 2, name: "Maemae", icon: "") )
//            
//            realm.add(Matching(id: 1, user_id: 1, start_date: Date(), end_date: fourHoursAfter!, isDate: false))
//            realm.add(Matching(id: 2, user_id: 2, start_date: Date(), end_date: twoDaysAfter!, isDate: true))
//            
//        }
//        
        
        
        
        
        
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
//        DateFormatterをつかう
        if matchings[indexPath.row].isDate {
            dateFormatter.dateFormat = "MM/dd(EEE)"
            let start_str = dateFormatter.string(from: matchings[indexPath.row].start_date)
            let end_str = dateFormatter.string(from: matchings[indexPath.row].end_date)
            cell.dateLabel.text = start_str + "-" + end_str
            // いい感じに計算する
//            dateFormatter.dateFormat = ""
//            let term =
//            cell.termLabel.text = "\(term) + days"
        } else {
            dateFormatter.dateFormat = "MM/dd(EEE)"
            let start_str = dateFormatter.string(from: matchings[indexPath.row].start_date)
            cell.dateLabel.text = start_str
            // いい感じに計算する
            dateFormatter.dateFormat = "HH:mm"
            let start_term = dateFormatter.string(from: matchings[indexPath.row].start_date)
            let end_term = dateFormatter.string(from: matchings[indexPath.row].end_date)
            cell.termLabel.text = start_term + "-" + end_term
        }
        let user = userModel.userForId(user_id: matchings[indexPath.row].user_id)
        
        cell.userNameLabel.text = user?.name
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.matchings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
