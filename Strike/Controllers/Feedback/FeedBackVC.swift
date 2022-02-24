//
//  FeedBackVC.swift
//  Strike
//
//  Created by user on 23/02/2022.
//

import UIKit
import iOSDropDown

class FeedBackVC: UIViewController {

    @IBOutlet weak var dropDownDW: DropDown!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        onViewLoaded()
    }
    
    func onViewLoaded()
    {
        setDropDown()
    }
    
    func setDropDown()
    {
        dropDownDW.optionArray = ["Did Frank deliver your product", "Did Frank deliver your product", "Did Frank deliver your product"]
        //Its Id Values and its optional

//        dropDownDW.didSelect{(selectedText , index ,id) in
//        self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"

    }

}
