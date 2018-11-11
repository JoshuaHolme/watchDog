//
//  InfoIC.swift
//  WatchDog
//
//  Created by Joshua Holme on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit
import UIKit


class InfoIC: WKInterfaceController
{
    @IBOutlet weak var bpmLabel: WKInterfaceLabel!
    @IBOutlet weak var breatheImage: WKInterfaceImage!
    
    let shrinkFactor = CGFloat(2.0 / 3)
    var expandFactor: CGFloat {
        return 1.0 / shrinkFactor
    }
    
    var currentBeatPatternIndex = 0
    var heartRateQuery: HKObserverQuery!
    var healthStore: HKHealthStore = HKHealthStore()
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(beatAnimation), userInfo: nil, repeats: true)
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
    @objc func beatAnimation() {
    
        self.fetchLatestHeartRateSample(completion: { sample in
            guard let sample = sample else {
                return
            }
            
            /// The completion in called on a background thread, but we
            /// need to update the UI on the main.
            DispatchQueue.main.async {
                
                /// Converting the heart rate to bpm
                let heartRateUnit = HKUnit(from: "count/min")
                let heartRate = sample
                    .quantity
                    .doubleValue(for: heartRateUnit)
                
                /// Updating the UI with the retrieved value
                self.bpmLabel.setText("\(Int(heartRate))")
            }
        })
        
    }
    
    public func subscribeToHeartBeatChanges() {
        
        // Creating the sample for the heart rate
        guard let sampleType: HKSampleType =
            HKObjectType.quantityType(forIdentifier: .heartRate) else {
                return
        }
        
        /// Creating an observer, so updates are received whenever HealthKit’s
        // heart rate data changes.
        self.heartRateQuery = HKObserverQuery.init(
            sampleType: sampleType,
            predicate: nil) { [weak self] _, _, error in
                guard error == nil else {
                    print(error!)
                    return
                }
                
                /// Yay, heart beat update!
        }
        
        if let query = self.heartRateQuery {
            self.healthStore.execute(query)
        }
    }
    
    public func fetchLatestHeartRateSample(
        completion: @escaping (_ sample: HKQuantitySample?) -> Void) {
        
        /// Create sample type for the heart rate
        guard let sampleType = HKObjectType
            .quantityType(forIdentifier: .heartRate) else {
                completion(nil)
                return
        }
        
        /// Predicate for specifiying start and end dates for the query
        let predicate = HKQuery
            .predicateForSamples(
                withStart: Date.distantPast,
                end: Date(),
                options: .strictEndDate)
        
        /// Set sorting by date.
        let sortDescriptor = NSSortDescriptor(
            key: HKSampleSortIdentifierStartDate,
            ascending: false)
        
        /// Create the query
        let query = HKSampleQuery(
            sampleType: sampleType,
            predicate: predicate,
            limit: Int(HKObjectQueryNoLimit),
            sortDescriptors: [sortDescriptor]) { (_, results, error) in
                
                guard error == nil else {
                    print("Error: \(error!.localizedDescription)")
                    return
                }
                
                completion(results?[0] as? HKQuantitySample)
        }
        
        self.healthStore.execute(query)
    }
    
    
}
