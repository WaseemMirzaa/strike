//
//  ContestViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//

import UIKit

class ContestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnjoin(_ sender: Any) {
        
        let vc:JoinContestViewController = self.storyboard?.instantiateViewController(withIdentifier: "JoinContestViewController") as! JoinContestViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
