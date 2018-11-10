//
//  ViewController.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit

class MethodsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var methods: [Method] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //methods = DataStorage.instance.getMethods()
        methods.append(Method(title: "Wife and Kids", icon: "RPi.jpg", canSendMessages: true, contacts: [5088224486], image: "", audio: "", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.instance.METHODS_CELL) as? MethodsTVCell else { return UITableViewCell()}
        
        cell.imageName = methods[indexPath.row].icon
        cell.title.text = methods[indexPath.row].title
        cell.containerView.backgroundColor = methods[indexPath.row].color
        
        
        return cell
    }
}

