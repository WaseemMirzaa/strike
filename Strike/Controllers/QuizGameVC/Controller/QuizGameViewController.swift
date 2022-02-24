//
//  QuizGameViewController.swift
//  Strike
//
//  Created by Buzzware Tech on 24/02/2022.
//

struct gameSectioData{
    var Question:String
    var arrayAnswer:[questionAns]
}
struct questionAns{
    
    var isSelect:Bool
    var ans:String
    
    
}

import UIKit

class QuizGameViewController: UIViewController {

    
    @IBOutlet weak var gameTableView: UITableView!
    
    var QuestionArray = [gameSectioData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ansAray1 = [questionAns]()
        ansAray1.append(questionAns(isSelect: true, ans: "Praesent in elementum massa elementum facilisis?"))
        

        self.QuestionArray.append(gameSectioData(Question: "", arrayAnswer: ansAray1))
        
        
        var ansAray = [questionAns]()
        ansAray.append(questionAns(isSelect: true, ans: "Sed id ornare nullam "))
        ansAray.append(questionAns(isSelect: false, ans: "Sagittis, aenean"))
        ansAray.append(questionAns(isSelect: false, ans: "Etiam egestas posuere"))
        ansAray.append(questionAns(isSelect: false, ans: "Nisl aliquam urna."))

        self.QuestionArray.append(gameSectioData(Question: "", arrayAnswer: ansAray))
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buymore(_ sender: Any) {
        
        
    }
    
}
extension QuizGameViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.QuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.QuestionArray[section].arrayAnswer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsTableViewCell") as! QuestionsTableViewCell
            
            cell.lblname.text = self.QuestionArray[indexPath.section].arrayAnswer[indexPath.row].ans
            
            return cell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "answerTableViewCell") as! answerTableViewCell
            
            cell.lblname.text = self.QuestionArray[indexPath.section].arrayAnswer[indexPath.row].ans
            
            if self.QuestionArray[indexPath.section].arrayAnswer[indexPath.row].isSelect{
            
                cell.iv_image.image = UIImage(named: "Group 736")
                cell.ivView.backgroundColor = UIColor().colorsFromAsset(name: .themeColor)
            
            }
            else{
                
                cell.iv_image.image = UIImage(named: "Ellipse 36")
                cell.ivView.backgroundColor = UIColor().colorsFromAsset(name: .bgCell)

            }
            
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            self.reloadAnsData(indexPath: indexPath)
        }
        
        
    }
    
    func reloadAnsData(indexPath:IndexPath){
        
        var array = self.QuestionArray[indexPath.section].arrayAnswer
        for (i,e) in array.enumerated(){
            array[i].isSelect = false
        }
        array[indexPath.row].isSelect = true
        self.QuestionArray[indexPath.section].arrayAnswer = array
        self.gameTableView.reloadData()
 
    }
    
    
    
    
}
