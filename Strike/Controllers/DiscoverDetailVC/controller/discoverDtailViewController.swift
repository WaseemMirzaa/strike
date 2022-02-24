//
//  discoverDtailViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit

class discoverDtailViewController: UIViewController {

    @IBOutlet weak var tablviewdetail: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
  

}
extension discoverDtailViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discoverdetailTableViewCell") as! discoverdetailTableViewCell
        
        cell.btnjoin.addTarget(self, action: #selector(joinBtn), for: .touchUpInside)
        
        return cell
        
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @objc func joinBtn(_ sender:UIButton){
        
        let vc:ContestViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContestViewController") as! ContestViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    
    
    
}
