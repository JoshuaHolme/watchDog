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
        
        do {
        
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: methods, requiringSecureCoding: false)
            defaults.set(encodedData, forKey: Constants.instance.METHOD_KEY)
            defaults.synchronize()
            completionBlock(true)
            
        } catch {
            
            completionBlock(false)
            print(error.localizedDescription)
            
        }
    }
    
    func getMethods() -> [Method] {
        
        do {
            
            let decoded  = defaults.object(forKey: Constants.instance.METHOD_KEY) as! Data
            let decodedMethods = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! [Method]
            return decodedMethods
            
        } catch {
            
            let decodedMethods: [Method] = []
            return decodedMethods
        }
    }
    
    
}
