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
    var icon: String
    var color: UIColor
    
    var canSendMessages: Bool
    var contacts: [String]
    
    var image: UIImage
    
    var audio: String
    
    init(title: String, icon: String, canSendMessages: Bool, contacts: [String], image: UIImage, audio: String, color: UIColor) {
        self.title = title
        self.icon = icon
        self.canSendMessages = canSendMessages
        self.contacts = contacts
        self.image = image
        self.audio = audio
        self.color = color
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: Constants.instance.TITLE) as! String
        let icon = aDecoder.decodeObject(forKey: Constants.instance.ICON) as! String
        let canSendMessages = aDecoder.decodeBool(forKey: Constants.instance.CAN_SEND_MESSAGES) 
        let contacts = aDecoder.decodeObject(forKey: Constants.instance.CONTACTS) as! [String]
        let image = aDecoder.decodeObject(forKey: Constants.instance.IMAGE) as! UIImage
        let audio = aDecoder.decodeObject(forKey: Constants.instance.AUDIO) as! String
        let color = aDecoder.decodeObject(forKey: Constants.instance.COLOR) as! UIColor
        
        self.init(title: title, icon: icon, canSendMessages: canSendMessages, contacts: contacts, image: image, audio: audio, color: color)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Constants.instance.TITLE)
        aCoder.encode(icon, forKey: Constants.instance.ICON)
        aCoder.encode(canSendMessages, forKey: Constants.instance.CAN_SEND_MESSAGES)
        aCoder.encode(contacts, forKey: Constants.instance.CONTACTS)
        aCoder.encode(image, forKey: Constants.instance.IMAGE)
        aCoder.encode(audio, forKey: Constants.instance.AUDIO)
        aCoder.encode(color, forKey: Constants.instance.COLOR)
    }
    
}
