//
//  ViewController.swift
//  myClock
//
//  Created by Corey Wade on 4/17/18.
//  Copyright © 2018 Corey Wade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //This is our label to display the current time
    @IBOutlet weak var currentTime: UILabel! {
        //We set the label to monospace so that it doesn't jump
        didSet {
            currentTime.font = UIFont.monospacedDigitSystemFont(ofSize: currentTime!.font!.pointSize, weight: UIFont.Weight.regular)
        }
    }
    
    //Dates are conveniently expressed with a DateFormatter()
    let myFormatter = DateFormatter()

    //We call this function every tenth of a second
    @objc func updateTimer() {
        // Date() gives the current Date and Time
        let now = Date()
        //Set our label to the DateFormatter()
        currentTime.text = myFormatter.string(from: now)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Select the style of the formatter upon loading
        myFormatter.timeStyle = .medium
        //Initiate the timer
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

