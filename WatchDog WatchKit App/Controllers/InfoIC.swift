//
//  InfoIC.swift
//  WatchDog
//
//  Created by Joshua Holme on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import WatchKit
import Foundation
import UIKit


class InfoIC: WKInterfaceController
{
    @IBOutlet weak var bpmLabel: WKInterfaceLabel!
    @IBOutlet weak var breatheImage: WKInterfaceImage!
    
    let shrinkFactor = CGFloat(2.0 / 3)
    var expandFactor: CGFloat {
        return 1.0 / shrinkFactor
    }
    
    var currentBeatPatternIndex = 0
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(beat), userInfo: nil, repeats: true)
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
    @objc func beat() {
    
//        self.animate(withDuration: <#T##TimeInterval#>) {
//            <#code#>
//        }
    }
}
