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
    
    var titleName: String = "Title"
    var icon: String = "icon"
    var canSendMessage: Bool = false
    var contacts: [String] = ["15088371117"]
    var image: UIImage = UIImage()
    var audio: String = "wave.mp4"
    var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
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
        icon = "Rain.pdf"
    }
    
    @IBAction func iconTwoPressed(_ sender: Any) {
        icon = "Waves.pdf"
    }
    
    @IBAction func iconThreePressed(_ sender: Any) {
        icon = "Night.pdf"
    }
    
    @IBAction func iconFourPressed(_ sender: Any) {
        icon = "family.pdf"
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
            var numbers: [String] = []
            for number in contact.phoneNumbers {
                self.canSendMessage = true
                numbers.append(number.value.stringValue)
            }
            self.contacts = numbers
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
        color = #colorLiteral(red: 0.3647058824, green: 0.568627451, blue: 0.8784313725, alpha: 1)
    }
    
    @IBAction func addColorTwo(_ sender: Any) {
        print("yellow")
        color = #colorLiteral(red: 0.8039215686, green: 0.6666666667, blue: 0.2352941176, alpha: 1)
    }
    
    @IBAction func addColorThree(_ sender: Any) {
        print("purple")
        color = #colorLiteral(red: 0.5921568627, green: 0.2, blue: 0.6980392157, alpha: 1)
    }
    
    @IBAction func addColorFour(_ sender: Any) {
        print("red")
        color = #colorLiteral(red: 0.8078431373, green: 0.3294117647, blue: 0.2392156863, alpha: 1)
    }
    
    @IBAction func addColorFive(_ sender: Any) {
        print("gray")
        color = UIColor.gray
    }
    
    @IBAction func addColorSix(_ sender: Any) {
        print("orange")
        color = #colorLiteral(red: 0.3058823529, green: 0.6862745098, blue: 0.7333333333, alpha: 1)
    }
    
    @IBAction func addColorSeven(_ sender: Any) {
        print("green")
        color = #colorLiteral(red: 0.2549019608, green: 0.5607843137, blue: 0.2901960784, alpha: 1)
    }
    
    @IBAction func addTherapy(_ sender: Any) {
        
        titleName = titleTextField.text!

        let newMethod: Method = Method(title: titleName, icon: icon, canSendMessages: canSendMessage, contacts: contacts, image: image, audio: audio, color: color)
        
        DataStorage.instance.appendMethod(append: newMethod, to: methods)
        
        performSegue(withIdentifier: Constants.instance.UNWIND_TO_METHODS, sender: self)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
