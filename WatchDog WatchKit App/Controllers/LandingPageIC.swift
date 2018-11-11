//
//  LandingPageIC.swift
//  WatchDog
//
//  Created by Joshua Holme on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import WatchKit
import AVFoundation
import Foundation

class LandingPageIC: WKInterfaceController
{
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
    
    // MARK: - Outlets
    @IBOutlet weak var StartBtn: WKInterfaceButton!
    
    
    @IBAction func StartBtnPressed()
    {
        WKInterfaceController.reloadRootControllers(withNames: ["Buttons", "Info", "Locket"], contexts: ["Button", "Info", "Locket"])
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSession.Category.playback, mode: .default, options: [])
        } catch let error{
            print(error)
        }
        
        let player: AVAudioPlayer
    
        let url = URL(fileURLWithPath: "breathe.mp4")
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            session.activate(options: []) { (success, error) in
                guard error == nil else {
                    print("*** An error occurred: \(error!.localizedDescription) ***")
                    // Handle the error here.
                    return
                }
                
                player.play()
            }
        } catch let error {
            print(error)
        }
    }
}
