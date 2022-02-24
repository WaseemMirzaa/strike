//
//  HomeViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//


struct homeData{
    var section:String
    var arrayData:[homearrayData]
    
    
}
struct homearrayData{
    
    var name:String
    var image:UIImage!
    
    
}
import UIKit
import LGSideMenuController


class HomeViewController: UIViewController {

    @IBOutlet weak var hometableView: UITableView!
    
    var array = [homeData]()
    var issearch = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuController?.leftViewWidth = self.view.bounds.width - self.view.bounds.width/4
        sideMenuController?.rootViewCoverAlphaForLeftView = 0.9
        sideMenuController?.rootViewLayerShadowRadius = 10.0
        
        sideMenuController?.leftViewSwipeGestureRange = .init(left: 0.0, right: 0.0)
        
        sideMenuController?.leftViewPresentationStyle = .slideAboveBlurred
        sideMenuController?.leftViewAnimationDuration = 1.0

        self.onloadData()
        
        // Do any additional setup after loading the view.
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
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))

        self.array.append(homeData(section: "Products you may like", arrayData: array1))
        
        self.hometableView.reloadData()
        self.hometableView.reloadSections(NSIndexSet(index: 1) as IndexSet, with: .automatic)

        
        
    }
    
    
    func onloadData(){
        
        var array2 = [homearrayData]()
        array2.append(homearrayData(name: "", image: nil))
        self.array.append(homeData(section: "New Contests", arrayData: array2))
        
        var array1 = [homearrayData]()
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))
        array1.append(homearrayData(name: "", image: nil))

        self.array.append(homeData(section: "Products you may like", arrayData: array1))
        
        self.hometableView.reloadData()
        
        
        
    }
    
    @IBAction func menyubtn(_ sender: Any) {
        
        self.sideMenuController?.toggleLeftView(animated: true, completion: nil)

    }
    
    @IBAction func searchbtn(_ sender: Any) {
        
        issearch = true
        self.onloadDataSearch()
        
    }
    
    @IBAction func notifybtn(_ sender: Any) {
    }
    
    
}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        if self.array[section].section != "S"{
            
            let headerView = Bundle.main.loadNibNamed("homeHeader", owner: self, options: nil)?.first as! homeHeader
            
            headerView.backgroundColor = UIColor.clear
            headerView.lblname.text = self.array[section].section

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
                
                return cell
            case 2:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomelikeTableViewCell") as! HomelikeTableViewCell
                
                return cell
                
            default:
                return UITableViewCell()
            }
        }
        else{
            switch indexPath.section{
                
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "homeCollectionTableViewCell") as! homeCollectionTableViewCell
                
                return cell
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomelikeTableViewCell") as! HomelikeTableViewCell
                
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
    
    @objc func SearchFilter(_ sender:UIButton){
        
        let vc:FilterViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        
        self.tabBarController?.present(vc, animated: true, completion: nil)
        
        
    }
}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell
        
        cell.btnconetst.addTarget(self, action: #selector(joinBtn), for: .touchUpInside)
        
        return cell
        
    }
    
    
    
    
    
    
}
