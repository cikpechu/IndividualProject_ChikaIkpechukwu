//
//  CerealDetailVC.swift
//  CerealTracker
//
//  Created by Chika Ikpechukwu on 4/4/20.
//  Copyright © 2020 Chika Ikpechukwu. All rights reserved.
//

import UIKit

class CerealDetailVC: UIViewController {
    
    @IBOutlet weak var cerealNamE: UILabel!
    
    var cN: CerealData?

    override func viewDidLoad() {
        super.viewDidLoad()

       
        cerealNamE.text = "\((cN?.cerealName)!) cereal contains \((cN?.cerealCalories)!) calories in \((cN?.cerealServings)!) of cereal"

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
