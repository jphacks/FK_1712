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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]

//        koyomi.delegate = self
        koyomiSetup()
        showEvent()
        
        print(FreeDate(start: Date(), end: Date()))
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
        return #colorLiteral(red: 1, green: 0.7942341566, blue: 0.1161259785, alpha: 1)
    }
    
}

extension CalendarViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "detail", sender: nil)
    }
}


