//
//  LoginViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITexfield_Additions!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var tfemailView: UIView!
    
    
    @IBOutlet weak var tfPassword: UITexfield_Additions!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var tfPasswordView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tfEmail.delegate  = self
        self.tfPassword.delegate = self
        self.Onload()

        // Do any additional setup after loading the view.
    }
    
    func Onload(){
        
        self.tfemailView.backgroundColor = .clear
        self.tfPasswordView.backgroundColor = .clear

    }
    


}
extension LoginViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.tfEmail{
            self.tfemailView.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            self.tfEmail.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lblemail.textColor = UIColor().colorsFromAsset(name: .themeColor)
        }
        else{
            
            self.tfPasswordView.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            tfPassword.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lblPassword.textColor = UIColor().colorsFromAsset(name: .themeColor)


        }
        
  
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == self.tfEmail{
            
            self.tfemailView.backgroundColor = .clear
            self.tfEmail.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lblemail.textColor = .black
        }
        else{
            
            self.tfPasswordView.backgroundColor = .clear
            tfPassword.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lblPassword.textColor = .black

        }
    }
    
    
}
