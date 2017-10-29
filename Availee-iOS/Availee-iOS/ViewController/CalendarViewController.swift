//
//  CalendarViewController.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import UIKit
import Koyomi

class CalendarViewController: UIViewController {
    @IBOutlet weak var koyomi: Koyomi!
    
    let model = CalendarModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        koyomi.delegate = self
        koyomiSetup()
        showEvent()
        
        print(FreeTime(start: Date(), end: Date()))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func koyomiSetup() {

        koyomi.calendarDelegate = self
        koyomi.dayPosition = .topLeft
        koyomi.selectionMode = .multiple(style: .line)
        koyomi.holidayColor = (.black,.black) // = (saturday: UIColor.black, sunday: UIColor.black)
        koyomi.lineView.height = 10
        koyomi.lineView.position = .bottom
        
        koyomi.select(date: Date())
        
    }
    
    func showEvent(){
        model.readEventsFromAppleCalendar {
            koyomi.select(dates: model.allStartDates ?? [])
        }
    }
    
    
}

extension CalendarViewController: KoyomiDelegate {
    
    func koyomi(_ koyomi: Koyomi, selectionTextColorForItemAt indexPath: IndexPath, date: Date) -> UIColor? {
        return #colorLiteral(red: 0.06666666667, green: 0.1215686275, blue: 0.2, alpha: 1)

    }
    
    func koyomi(_ koyomi: Koyomi, selectionColorForItemAt indexPath: IndexPath, date: Date) -> UIColor? {
        return #colorLiteral(red: 0.137254902, green: 0.8666666667, blue: 0.6980392157, alpha: 1)
    }
    
}

extension CalendarViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: nil)
    }
}


