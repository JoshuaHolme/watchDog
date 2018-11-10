//
//  Model.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import Foundation
import UIKit

class Method: NSObject, NSCoding {
    
    var title: String
    var icon: UIImage
    
    var canSendMessages: Bool
    var contacts: [Int]
    
    var image: String
    
    var audio: String
    
    init(title: String, icon: UIImage, canSendMessages: Bool, contacts: [Int]) {
        self.title = title
        self.icon = icon
        self.canSendMessages = canSendMessages
        self.contacts = contacts
        self.image = ""
        self.audio = ""
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeInteger(forKey: "id")
        let icon = aDecoder.decodeObject(forKey: "name") as! String
        let canSendMessages = aDecoder.decodeObject(forKey: "shortname") as! String
        let contacts = aDecoder.decodeObject(forKey: "") as! [Int]
        
        
        self.init(id: title, name: icon, shortname: canSendMessages)
    }
    
    func encode(with aCoder: NSCoder) {
    aCoder.encode(title, forKey: "id")
    aCoder.encode(icon, forKey: "name")
    aCoder.encode(canSendMessages, forKey: "shortname")
    }
    
}
