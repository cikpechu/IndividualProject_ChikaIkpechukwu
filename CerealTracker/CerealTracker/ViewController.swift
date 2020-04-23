//
//  ViewController.swift
//  CerealTracker
//
//  Created by Chika Ikpechukwu on 4/4/20.
//  Copyright © 2020 Chika Ikpechukwu. All rights reserved.
//

import UIKit

class CerealData {
    var cerealName: String
    var cerealCalories: String
    var cerealServings: String

    init(Name:String, CaloriesNum:String, Serving:String) {
        self.cerealName = Name
        self.cerealCalories = CaloriesNum
        self.cerealServings = Serving
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cerealTable: UITableView!
    

    var DataArr = [CerealData]()
    
    @IBOutlet weak var titleCerealList: UILabel!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleCerealList.text = "Cereal List"
        // Do any additional setup after loading the view.
        let a = CerealData(Name: "100% Bran", CaloriesNum: "70", Serving: "0.33 cups")
        DataArr.append(a)
        let b = CerealData(Name: "100% Natural Bran", CaloriesNum: "120", Serving: "1 cups")
        DataArr.append(b)
        let c = CerealData(Name: "All-Bran", CaloriesNum: "70", Serving: "0.33 cups")
        DataArr.append(c)
        let d = CerealData(Name: "All-Bran with Extra Fiber", CaloriesNum: "50", Serving: "0.5 cups")
        DataArr.append(d)
        let e = CerealData(Name: "Almond Delight", CaloriesNum: "110", Serving: "0.75 cups")
        DataArr.append(e)
        let f = CerealData(Name: "Apple Cinnamon Cheerios", CaloriesNum: "110", Serving: "0.75 cups")
        DataArr.append(f)
        let g = CerealData(Name: "Apple Jacks", CaloriesNum: "110", Serving: "1 cups")
        DataArr.append(g)
        let h = CerealData(Name: "Basic 4", CaloriesNum: "130", Serving: "0.75 cups")
        DataArr.append(h)
        let i = CerealData(Name: "Bran Chex", CaloriesNum: "90", Serving: "0.67")
        DataArr.append(i)
        let j = CerealData(Name: "Bran Flakes", CaloriesNum: "90", Serving: "0.67")
        DataArr.append(j)
        let k = CerealData(Name: "Cap'n'Crunch", CaloriesNum: "120", Serving: "0.75")
        DataArr.append(k)
        let l = CerealData(Name: "Cheerios", CaloriesNum: "110", Serving: "1.25")
        DataArr.append(l)
        let m = CerealData(Name: "Cinnamon Toast Crunch", CaloriesNum: "120", Serving: "0.75")
        DataArr.append(m)
        let n = CerealData(Name: "Clusters", CaloriesNum: "110", Serving: "0.5")
        DataArr.append(n)
        let o = CerealData(Name: "Cocoa Puffs", CaloriesNum: "110", Serving: "1")
        DataArr.append(o)
        let p = CerealData(Name: "Corn Chex", CaloriesNum: "110", Serving: "1")
        DataArr.append(p)
        let q = CerealData(Name: "Corn Flakes", CaloriesNum: "100", Serving: "1")
        DataArr.append(q)
        let r = CerealData(Name: "Cocoa Pops", CaloriesNum: "110", Serving: "1")
        DataArr.append(r)
        let s = CerealData(Name: "Count Chocula", CaloriesNum: "110", Serving: "1")
        DataArr.append(s)
        let t = CerealData(Name: "Cracklin' Oat Bran", CaloriesNum: "110", Serving: "0.5")
        DataArr.append(t)
        
        cerealTable.dataSource = self
        cerealTable.delegate = self
        
    }
    

      func numberOfSections(in tableView: UITableView) -> Int {
           return 1
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DataArr.count
        }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CerealCell", for: indexPath) as UITableViewCell

            cell.textLabel?.text = DataArr[indexPath.row].cerealName
            cell.detailTextLabel?.text = DataArr[indexPath.row].cerealCalories
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: true)
         performSegue(withIdentifier: "showCerealDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CerealDetailVC {
            destination.cN = DataArr[(cerealTable.indexPathForSelectedRow?.row)!]
            cerealTable.deselectRow(at: cerealTable.indexPathForSelectedRow!, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
