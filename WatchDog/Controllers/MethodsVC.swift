//
//  ViewController.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit
import HealthKit

class MethodsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var methods: [Method] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
        if HKHealthStore.isHealthDataAvailable() {
            // Add code to use HealthKit here.
            let healthStore = HKHealthStore()
            
            let allTypes = Set([HKObjectType.workoutType(),
                                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                                HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
                                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                                HKObjectType.quantityType(forIdentifier: .heartRate)!])
            
            healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
                if !success {
                    // Handle the error here.
            }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        methods = DataStorage.instance.getMethods()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        methods = DataStorage.instance.getMethods()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.instance.METHODS_CELL) as? MethodsTVCell else { return UITableViewCell()}
        
        cell.imageName = methods[indexPath.row].icon
        cell.title.text = methods[indexPath.row].title
        cell.containerView.backgroundColor = methods[indexPath.row].color
        
        
        return cell
    }
    
    @IBAction func unwindToMethods(segue:UIStoryboardSegue) { }

}
