//
//  SupportVC.swift
//  Strike
//
//  Created by user on 24/02/2022.
//

import UIKit
import iOSDropDown

class SupportVC: UIViewController, UITextViewDelegate  {
    
    
    @IBOutlet weak var topicDropDown: DropDown!
    
    @IBOutlet weak var problemTV: UITextView!
    
    var placeholderLabel : UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        onViewLoaded()
    }
    
    func onViewLoaded()
    {
        setDropDown()
        
        setTextViewPlacehoder()
    }
    
    func setTextViewPlacehoder()
    {
        problemTV.delegate = self
        
        placeholderLabel = UILabel()
        
        placeholderLabel.text = "Describe Problem"
        placeholderLabel.font = UIFont(name: "MazzardL-Regular", size: 20.0)
        
        placeholderLabel.sizeToFit()
        
        problemTV.addSubview(placeholderLabel)
        
        problemTV.frame.origin = CGPoint(x: 5, y: (problemTV.font?.pointSize)! / 2)
        
        placeholderLabel.textColor = UIColor.black
        placeholderLabel.isHidden = !problemTV.text.isEmpty
    }
    
    func setDropDown()
    {
        topicDropDown.optionArray = ["Select Topic", "Did Frank deliver your product", "Did Frank deliver your product"]
    }
    
    
    func textViewDidChange(_ textView: UITextView)
    {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
        
}
