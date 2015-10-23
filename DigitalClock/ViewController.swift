//
//  ViewController.swift
//  DigitalClock
//
//  Created by Veena on 10/23/15.
//  Copyright © 2015 Veena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimeLabel.text = ""
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateClock"), userInfo: nil, repeats: true)
        
        
    }
    func updateClock(){
        
        let date = NSDate()
        let calender = NSCalendar.currentCalendar()
    
        let components = calender.components([.Hour, .Minute, .Second], fromDate: date)
        
        var hour = components.hour > 12 ? components.hour - 12 : components.hour
        
        hour = hour == 0 ? 12 : hour
        
        let hourString = hour > 9 ? "\(hour)" : "0\(hour)"
        let minuteString = components.minute > 9 ? "\(components.minute)" : "0\(components.minute)"
        let secondString = components.second > 9 ? "\(components.second)" : "0\(components.second)"
        let am = components.hour > 12 ? "AM" : "PM"
        
        myTimeLabel.text = "\(hourString) : \(minuteString) : \(secondString) \(am)"
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

