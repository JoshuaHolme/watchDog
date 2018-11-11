//
//  addTherapyVC.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit
import ContactsUI

class addTherapyVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CNContactPickerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notifyPeopleSwitch: UISwitch!
    @IBOutlet weak var addTherapyBtn: UIButton!
    @IBOutlet weak var wavesBtn: UIButton!
    @IBOutlet weak var windBtn: UIButton!
    @IBOutlet weak var breatheButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    var titleName: String!
    var icon: String!
    var canSendMessage: Bool!
    var contacts: [String]!
    var image: UIImage!
    var audio: String!
    var color: UIColor!
    
    var methods: [Method]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyPeopleSwitch.isOn = false
        imagePicker.delegate = self
        
        addTherapyBtn.layer.cornerRadius = 30
        wavesBtn.layer.cornerRadius = 10
        windBtn.layer.cornerRadius = 10
        breatheButton.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addTherapyVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        methods = DataStorage.instance.getMethods()
    }
    
    @IBAction func imageButtonPushed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = image
        } else{
            print("Something went wrong in  image")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        } else {
            contacts = []
        }
        
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                self.contacts.append(number.value.stringValue)
            }
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }
    
    @IBAction func waveMusicPressed(_ sender: Any) {
        print("wave")
        audio = "wave.mp4"
        wavesBtn.isSelected = true
    }
    
    @IBAction func windMusicPressed(_ sender: Any) {
        print("wind")
        audio = "wind.mp4"
    }
    
    @IBAction func breathMusicToggled(_ sender: Any) {
        print("breathe")
        audio = "breathe.mp4"
    }
    
    @IBAction func addColorOne(_ sender: Any) {
        print("blue")
        color = UIColor.blue
    }
    
    @IBAction func addColorTwo(_ sender: Any) {
        print("yellow")
        color = UIColor.yellow
    }
    
    @IBAction func addColorThree(_ sender: Any) {
        print("purple")
        color = UIColor.purple
    }
    
    @IBAction func addColorFour(_ sender: Any) {
        print("red")
        color = UIColor.red
    }
    
    @IBAction func addColorFive(_ sender: Any) {
        print("gray")
        color = UIColor.gray
    }
    
    @IBAction func addColorSix(_ sender: Any) {
        print("orange")
        color = UIColor.orange
    }
    
    @IBAction func addColorSeven(_ sender: Any) {
        print("green")
        color = UIColor.green
    }
    
    @IBAction func addTherapy(_ sender: Any) {
        
        titleName = titleTextField.text!
//
//        let newMethod: Method = Method(title: titleName, icon: icon, canSendMessages: canSendMessage, contacts: contacts, image: image, audio: audio, color: color)
//            
//        DataStorage.instance.appendMethod(append: newMethod, to: methods)
//        
        performSegue(withIdentifier: Constants.instance.UNWIND_TO_METHODS, sender: self)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
