//
//  addTherapyVC.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit

class addTherapyVC: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notifyPeopleSwitch: UISwitch!
    @IBOutlet weak var addTherapyBtn: UIButton!
    
    var titleName: String!
    var icon: String!
    var canSendMessage: Bool!
    var contacts: [Int]!
    var image: String!
    var audio: String!
    var color: UIColor!
    
    var methods: [Method]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        methods = DataStorage.instance.getMethods()

        // Do any additional setup after loading the view.
        self.navigationBar.backgroundColor = UIColor.clear
        self.navigationBar.isTranslucent = false
    }
    
    @IBAction func imageButtonPushed(_ sender: Any) {
        
    }
    
    @IBAction func iconOnePressed(_ sender: Any) {
        icon = ""
    }
    
    @IBAction func iconTwoPressed(_ sender: Any) {
        icon = ""
    }
    
    @IBAction func iconThreePressed(_ sender: Any) {
        icon = ""
    }
    
    @IBAction func iconFourPressed(_ sender: Any) {
        icon = ""
    }
    
    @IBAction func notifyPeopleToggle(_ sender: Any) {
        if notifyPeopleSwitch.isOn {
            // Implement Contacts Thing
        } else {
            contacts = []
        }
        
    }
    
    @IBAction func waveMusicPressed(_ sender: Any) {
        audio = ""
    }
    
    @IBAction func windMusicPressed(_ sender: Any) {
        audio = ""
    }
    
    @IBAction func breathMusicToggled(_ sender: Any) {
        audio = ""
    }
    
    @IBAction func addColorOne(_ sender: Any) {
        color = UIColor.blue
    }
    
    @IBAction func addColorTwo(_ sender: Any) {
        color = UIColor.yellow
    }
    
    @IBAction func addColorThree(_ sender: Any) {
        color = UIColor.purple
    }
    
    @IBAction func addColorFour(_ sender: Any) {
        color = UIColor.red
    }
    
    @IBAction func addColorFive(_ sender: Any) {
        color = UIColor.gray
    }
    
    @IBAction func addColorSix(_ sender: Any) {
        color = UIColor.orange
    }
    
    @IBAction func addColorSeven(_ sender: Any) {
        color = UIColor.green
    }
    
    @IBAction func addTherapy(_ sender: Any) {
        
        let newMethod: Method = Method(title: titleName, icon: icon, canSendMessages: canSendMessage, contacts: contacts, image: image, audio: audio, color: color)
            
        DataStorage.instance.appendMethod(append: newMethod, to: methods)
        
        dismiss(animated: true, completion: nil)
        
    }
}
