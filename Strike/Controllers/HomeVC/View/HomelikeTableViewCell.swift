//
//  HomelikeTableViewCell.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//

import UIKit

class HomelikeTableViewCell: UITableViewCell {

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var btnfindme: UIButton!
    @IBOutlet weak var lblname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
