//
//  sideMenuTableViewCell.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit

class sideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
