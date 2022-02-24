//
//  BuyticketViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit

class BuyticketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addcard(_ sender: Any) {
        
        let vc:AddMoreCardViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddMoreCardViewController") as! AddMoreCardViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
