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
    
    init(title: String, icon: UIImage, canSendMessages: Bool, contacts: [Int], image: String, audio: String) {
        self.title = title
        self.icon = icon
        self.canSendMessages = canSendMessages
        self.contacts = contacts
        self.image = image
        self.audio = audio
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: Constants.instance.TITLE) as! String
        let icon = aDecoder.decodeObject(forKey: Constants.instance.ICON) as! UIImage
        let canSendMessages = aDecoder.decodeObject(forKey: Constants.instance.CAN_SEND_MESSAGES) as! Bool
        let contacts = aDecoder.decodeObject(forKey: Constants.instance.CONTACTS) as! [Int]
        let image = aDecoder.decodeObject(forKey: Constants.instance.IMAGE) as! String
        let audio = aDecoder.decodeObject(forKey: Constants.instance.AUDIO) as! String
        
        self.init(title: title, icon: icon, canSendMessages: canSendMessages, contacts: contacts, image: image, audio: audio)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Constants.instance.TITLE)
        aCoder.encode(icon, forKey: Constants.instance.ICON)
        aCoder.encode(canSendMessages, forKey: Constants.instance.CAN_SEND_MESSAGES)
        aCoder.encode(contacts, forKey: Constants.instance.CONTACTS)
        aCoder.encode(image, forKey: Constants.instance.IMAGE)
        aCoder.encode(audio, forKey: Constants.instance.AUDIO)
    }
    
}