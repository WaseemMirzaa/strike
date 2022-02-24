//
//  FilterViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 23/02/2022.
//
struct sizestruct{
    var name:String
    var isSelected:Bool
}

struct Colorstruct{
    
    var color:UIColor
    var name:String
    var isSelected:Bool
}

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var tfcolors: UITexfield_Additions!
    @IBOutlet weak var dropDownCat: UITexfields_Additions!
    
    @IBOutlet weak var dropdownBrand: UITexfields_Additions!
    
    @IBOutlet weak var imagebrand: UIImageView!
    
    @IBOutlet weak var colorCollection: UICollectionView!
    @IBOutlet weak var sizeCollection: UICollectionView!
    
    var coloraray = [Colorstruct]()
    var stringArray = [String]()

    var sizeArray = [sizestruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filldata()
        // Do any additional setup after loading the view.
    }
    
    func filldata(){
        
        self.stringArray.removeAll()
        self.coloraray.removeAll()
        self.sizeArray.removeAll()
        self.coloraray.append(Colorstruct(color: UIColor.red, name: "#red", isSelected: false))
        self.coloraray.append(Colorstruct(color: UIColor.blue, name: "#blue", isSelected: false))
        self.coloraray.append(Colorstruct(color: UIColor.green, name: "#green", isSelected: false))
        self.coloraray.append(Colorstruct(color: UIColor.purple, name: "#purple", isSelected: false))
        self.coloraray.append(Colorstruct(color: UIColor.black, name: "#black", isSelected: false))
        self.coloraray.append(Colorstruct(color: UIColor.yellow, name: "#yellow", isSelected: false))
        
        
        self.sizeArray.append(sizestruct(name: "9", isSelected: false))
        self.sizeArray.append(sizestruct(name: "9.5", isSelected: false))

        self.sizeArray.append(sizestruct(name: "10", isSelected: false))
        self.sizeArray.append(sizestruct(name: "10.5", isSelected: false))
        self.sizeArray.append(sizestruct(name: "11", isSelected: false))
        self.sizeArray.append(sizestruct(name: "11.5", isSelected: false))
        
        
        self.colorCollection.reloadData()
        self.sizeCollection.reloadData()


        
    }
    
    
    @IBAction func reloadbtn(_ sender: Any) {
        self.filldata()
        self.tfcolors.text = ""

    }
    
    @IBAction func applybtn(_ sender: Any) {
        
        self.dismissVCAction()
        
    }
    
}
extension FilterViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.colorCollection{
            return coloraray.count
        }
        else{
            return sizeArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.colorCollection{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
            
            cell.colorView.backgroundColor = coloraray[indexPath.row].color
            
            if coloraray[indexPath.row].isSelected{
                cell.colorView.borderColor = UIColor().colorsFromAsset(name: .themeColor)
                cell.colorView.borderWidth  = 2
            }
            else{
                cell.colorView.borderColor = UIColor().colorsFromAsset(name: .bgCell)
                cell.colorView.borderWidth  = 0
            }
            
            
            return cell
            
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sizeCollectionViewCell", for: indexPath) as! sizeCollectionViewCell
            
            
            cell.lblname.text = sizeArray[indexPath.row].name
            if sizeArray[indexPath.row].isSelected{
                cell.sizeView.backgroundColor = UIColor().colorsFromAsset(name: .themeColor)
            }
            else{
                cell.sizeView.backgroundColor = UIColor().colorsFromAsset(name: .bgCell)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.colorCollection{
           
            self.reloadDataColor(index: indexPath.row)
            
        }
        else{
            self.reloadSizeData(index: indexPath.row)

        }
    }
    
    
    func reloadDataColor(index:Int){
        
        var arrayDummy = self.coloraray
        for (index,elementss) in arrayDummy.enumerated(){
            arrayDummy[index].isSelected = false
        }
        arrayDummy[index].isSelected = true
        self.stringArray.append(arrayDummy[index].name)
        self.tfcolors.text = stringArray.joined(separator: ",")
        self.coloraray = arrayDummy
        self.colorCollection.reloadData()
        
    }
    
    func reloadSizeData(index:Int){
        
        var arrayDummy = self.sizeArray
        for (index,elementss) in arrayDummy.enumerated(){
            arrayDummy[index].isSelected = false
        }
        arrayDummy[index].isSelected = true
        self.sizeArray = arrayDummy
        self.sizeCollection.reloadData()
    }
    
    
    
    
    
    
    
    
}
