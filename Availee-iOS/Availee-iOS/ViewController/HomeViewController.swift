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

    @IBOutlet weak var tableView: UITableView!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
 //       let user = 
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matching", for: indexPath) as! MatchingTableViewCell
        
        guard let matchings = model.matchings else {
            return cell
        }
        
        if matchings[indexPath.row].isDate {
            // いい感じに計算する予定
            cell.dateLabel.text = "\(matchings[indexPath.row].start_date) + \(matchings[indexPath.row].end_date)"
            cell.termLabel.text = "3days"
        } else {
            // いい感じに計算する予定
            cell.dateLabel.text = "\(matchings[indexPath.row].start_date)"
            cell.termLabel.text = "\(matchings[indexPath.row].start_date) + \(matchings[indexPath.row].end_date)"
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
