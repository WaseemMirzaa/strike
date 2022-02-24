//
//  SideMenuViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//
struct sideMenuData{
    
    var name:String
    var image:UIImage
    var selectImage:UIImage!
    var isselected:Bool
    
}
import UIKit
import LGSideMenuController

class SideMenuViewController: UIViewController {

    @IBOutlet weak var sidemenutablview: UITableView!
    
    
    var array = [sideMenuData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.array.append(sideMenuData(name: "Home", image: UIImage(named: "Home3")!, selectImage: UIImage(named: "Home2")!, isselected: false))
        
        self.array.append(sideMenuData(name: "Setting", image: UIImage(named: "Vector-4")!, selectImage: UIImage(named: "Vector-4")!, isselected: false))
        self.array.append(sideMenuData(name: "Support", image: UIImage(named: "Group 721-1")!, selectImage: UIImage(named: "Group 721-1")!, isselected: false))
        self.array.append(sideMenuData(name: "Terms & Conditions", image: UIImage(named: "Vector-3")!, selectImage: UIImage(named: "Vector-3")!, isselected: false))
        
        self.array.append(sideMenuData(name: "empty", image: UIImage(named: "Vector-2")!, selectImage: UIImage(named: "Vector-2")!, isselected: false))
        self.array.append(sideMenuData(name: "Log Out", image: UIImage(named: "Vector-2")!, selectImage: UIImage(named: "Vector-2")!, isselected: false))

        // Do any additional setup after loading the view.
    }
    


}
extension SideMenuViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if array[indexPath.row].name == "empty"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyvieTableViewCell") as! EmptyvieTableViewCell
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell") as! sideMenuTableViewCell
            
            if array[indexPath.row].isselected{
                cell.lblname.textColor = .black
                cell.lblname.text = array[indexPath.row].name
                cell.ivView.backgroundColor = UIColor().colorsFromAsset(name: .themeColor)
                cell.ivImage.image = array[indexPath.row].image
            }
            else{
                cell.lblname.textColor = UIColor().colorsFromAsset(name: .themeColor)
                cell.lblname.text = array[indexPath.row].name
                cell.ivView.backgroundColor = UIColor().colorsFromAsset(name: .bgCell)
                cell.ivImage.image = array[indexPath.row].image
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
        
        
        switch indexPath.row{
            
        case 0:
            print("noting")
            
            let vc =  mainStoryboard.instantiateViewController(identifier: "customBarViewController")
            
             self.sideMenuController?.rootViewController = vc
             self.sideMenuController?.toggleLeftView(animated: true, completion: nil)
            
            
        case 1:
            print("noting")
        case 2:
            print("noting")
        case 3:
            print("noting")
        case 4:
            print("noting")
        default:
            print("noting")
            
        }
    }
    
    
    
    
    
}
