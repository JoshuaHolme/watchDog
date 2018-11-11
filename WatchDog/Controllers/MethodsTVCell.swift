//
//  MethodsTVCell.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit

class MethodsTVCell: UITableViewCell {

    @IBOutlet weak var imgIcn: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var imageName: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    @IBAction func optionButtonPressed(_ sender: Any) {
        
    }
}
