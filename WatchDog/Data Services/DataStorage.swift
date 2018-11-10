//
//  File.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import Foundation
import UIKit

class DataStorage {
    
    static let instance = DataStorage()
    let defaults = UserDefaults.standard
    
    var Methods: [Method]?
    {
        get
        {
            return defaults.array(forKey: Constants.instance.METHOD_KEY) as! [Method]?
        }
        set
        {
            defaults.set(newValue, forKey: Constants.instance.METHOD_KEY)
        }
    }
}
