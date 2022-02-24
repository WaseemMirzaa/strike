//
//  discoverViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

import UIKit
import LGSideMenuController

class discoverViewController: UIViewController {

    @IBOutlet weak var discoverTableView: UITableView!
    
    var array = [homeData]()
    var issearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onloadData()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func menubtn(_ sender: Any) {
        
        self.sideMenuController?.toggleLeftView(animated: true, completion: nil)

        
    }
    
    @IBAction func searchbtn(_ sender: Any) {
        
        issearch = true
        self.onloadDataSearch()
    }
    
    func onloadDataSearch(){
        
        self.array.removeAll()
        var array12 = [homearrayData]()
        array12.append(homearrayData(name: "", image: nil))
        self.array.append(homeData(section: "S", arrayData: array12))
        
        var array2 = [homearrayData]()
        array2.append(homearrayData(name: "", image: nil))
        self.array.append(homeData(section: "New Contests", arrayData: array2))
        
        var array1 = [homearrayData]()
        array1.append(homearrayData(name: "", image: nil))

        self.array.append(homeData(section: "Upcoming Contests", arrayData: array1))
        
        self.discoverTableView.reloadData()
        self.discoverTableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .automatic)

        
        
    }
    
    
    func onloadData(){
        
        var array2 = [homearrayData]()
        array2.append(homearrayData(name: "", image: nil))
        self.array.append(homeData(section: "New Contests", arrayData: array2))
        
        var array1 = [homearrayData]()
        array1.append(homearrayData(name: "", image: nil))

        self.array.append(homeData(section: "Upcoming Contests", arrayData: array1))

        
        self.discoverTableView.reloadData()
        
        
        
    }


}
extension discoverViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        if self.array[section].section != "S"{
            
            let headerView = Bundle.main.loadNibNamed("homeHeader", owner: self, options: nil)?.first as! homeHeader
            
            headerView.backgroundColor = UIColor.clear
            headerView.lblname.text = self.array[section].section
            headerView.btnseemore.accessibilityHint = self.array[section].section
            headerView.btnseemore.addTarget(self, action: #selector(seerMoreUpcoming), for: .touchUpInside)

            return headerView
        }
        else{
            return UIView()
        }
        

        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.array[section].section != "S"{
            return 60

        }
        else{
            return 0

        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array[section].arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if issearch{
            switch indexPath.section{
                
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "homesearchTableViewCell") as! homesearchTableViewCell
                cell.filterbtn.addTarget(self, action: #selector(SearchFilter), for: .touchUpInside)
                
                return cell
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "homeCollectionTableViewCell") as! homeCollectionTableViewCell
                
                cell.homecolletion.tag = 1
                
                return cell
            case 2:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "discoverColectionTableViewCell") as! discoverColectionTableViewCell
                
                cell.ShoesCollection.tag = 2

                return cell
                
            default:
                return UITableViewCell()
            }
        }
        else{
            switch indexPath.section{
                
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "homeCollectionTableViewCell") as! homeCollectionTableViewCell
                cell.homecolletion.tag = 1

                return cell
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "discoverColectionTableViewCell") as! discoverColectionTableViewCell
                
                cell.ShoesCollection.tag = 2

                return cell
                
            default:
                return UITableViewCell()
            }
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    @objc func joinBtn(_ sender:UIButton){
        
        let vc:ContestViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContestViewController") as! ContestViewController
        
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func seerMoreUpcoming(_ sender:UIButton){
        
        
        if sender.accessibilityHint == "Upcoming Contests"{
            
            let vc:discoverDtailViewController = self.storyboard?.instantiateViewController(withIdentifier: "discoverDtailViewController") as! discoverDtailViewController
            
            self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        }
        
 
        
        
    }
    @objc func SearchFilter(_ sender:UIButton){
        
        let vc:FilterViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        
        self.tabBarController?.present(vc, animated: true, completion: nil)
        
        
    }
}
extension discoverViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcommingCollectionViewCell", for: indexPath) as! upcommingCollectionViewCell
            
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell
            
            cell.btnconetst.addTarget(self, action: #selector(joinBtn), for: .touchUpInside)
            
            return cell
        }
        
  
        
    }
    
    
    
    
    
    
}
