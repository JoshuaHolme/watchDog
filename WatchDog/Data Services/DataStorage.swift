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
    
    func setMethods(methods: [Method], completionBlock: @escaping (Bool) -> Void) -> Void {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: methods)
        defaults.set(encodedData, forKey: "teams")
        defaults.synchronize()
    }
}
