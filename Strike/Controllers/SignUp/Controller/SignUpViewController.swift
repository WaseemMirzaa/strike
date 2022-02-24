//
//  SignUpViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITexfield_Additions!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var tfemailView: UIView!
    
    
    @IBOutlet weak var tfuser: UITexfield_Additions!
    @IBOutlet weak var lbltfuser: UILabel!
    @IBOutlet weak var tfuserView: UIView!

    
    
    @IBOutlet weak var tfPassword: UITexfield_Additions!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var tfPasswordView: UIView!
    
    
    
    @IBOutlet weak var tfPassword2: UITexfield_Additions!
    @IBOutlet weak var lblPassword2: UILabel!
    @IBOutlet weak var tfPasswordView2: UIView!
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tfEmail.delegate  = self
        self.tfPassword.delegate = self
        self.tfuser.delegate  = self
        self.tfPassword2.delegate = self
        self.Onload()

        // Do any additional setup after loading the view.
    }
    
    func Onload(){
        
        self.tfemailView.backgroundColor = .clear
        self.tfPasswordView.backgroundColor = .clear
        self.tfPasswordView2.backgroundColor = .clear
        self.tfuserView.backgroundColor = .clear
        

    }
    


}

extension SignUpViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.tfEmail{
            self.tfemailView.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            self.tfEmail.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lblemail.textColor = UIColor().colorsFromAsset(name: .themeColor)
        }
        else if textField == self.tfuser{
            
            self.tfuserView.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            tfuser.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lbltfuser.textColor = UIColor().colorsFromAsset(name: .themeColor)


        }
        else if textField == self.tfPassword{
            
            self.tfPasswordView.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            tfPassword.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lblPassword.textColor = UIColor().colorsFromAsset(name: .themeColor)


        }
        else if textField == self.tfPassword2{
            
            self.tfPasswordView2.backgroundColor = UIColor().colorsFromAsset(name: .tfBgColor)
            tfPassword2.borderColor = UIColor().colorsFromAsset(name: .themeColor)
            lblPassword2.textColor = UIColor().colorsFromAsset(name: .themeColor)


        }
        
  
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == self.tfEmail{
            self.tfemailView.backgroundColor = .clear
            self.tfEmail.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lblemail.textColor = .black
        }
        else if textField == self.tfuser{
            
            self.tfuserView.backgroundColor = .clear
            tfuser.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lbltfuser.textColor = .black


        }
        else if textField == self.tfPassword{
            
            self.tfPasswordView.backgroundColor = .clear
            tfPassword.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lblPassword.textColor = .black


        }
        else if textField == self.tfPassword2{
            
            self.tfPasswordView2.backgroundColor = .clear
            tfPassword2.borderColor = UIColor().colorsFromAsset(name: .tfBorderColor)
            lblPassword2.textColor = .black


        }
    }
    
    
}
