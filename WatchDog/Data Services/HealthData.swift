//
//  healthData.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/11/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import Foundation
import UIKit

class HealthData: NSObject, NSCoding {
    
    var bpm: Int!
    var descript: String!
    var timeFrame: Int!
    var setting: String!
    
    init(bpm: Int, descript: String, timeFrame: Int, setting: String) {
        self.bpm = bpm
        self.descript = descript
        self.timeFrame = timeFrame
        self.setting = setting
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bpm, forKey: Constants.instance.BPM)
        aCoder.encode(descript, forKey: Constants.instance.DESCRIPTION)
        aCoder.encode(timeFrame, forKey: Constants.instance.TIME_FRAME)
        aCoder.encode(setting, forKey: Constants.instance.SETTING)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let bpm = aDecoder.decodeInteger(forKey: Constants.instance.BPM)
        let descript = aDecoder.decodeObject(forKey: Constants.instance.DESCRIPTION) as! String
        let timeFrame = aDecoder.decodeInteger(forKey: Constants.instance.TIME_FRAME)
        let setting = aDecoder.decodeObject(forKey: Constants.instance.SETTING) as! String
        
        self.init(bpm: bpm, descript: descript, timeFrame: timeFrame, setting: setting)
    }
    
}
