//
//  homesearchTableViewCell.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//

import UIKit

class homesearchTableViewCell: UITableViewCell {

    @IBOutlet weak var filterbtn: UIButton!
    @IBOutlet weak var seatchtf: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
