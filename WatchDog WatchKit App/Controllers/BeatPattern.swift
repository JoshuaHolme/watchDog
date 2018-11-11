//
//  BPM.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import Foundation
import UIKit

struct BeatPattern {
    
        var color = UIColor.self
        var description = "Mid-range"
        var bpm = 80
    
        var duration: Double {
            return 60.0 / Double(bpm)
        }
    
    init(color: UIColor.Type, description: String, bpm: Int) {
        self.color = color
        self.description = description
        self.bpm = bpm
    }
    }
