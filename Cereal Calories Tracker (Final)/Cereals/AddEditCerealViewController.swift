//
//  AddEditCerealViewController.swift
//  Cereal Calories Tracker
//
//  Created by Chika Ikpechukwu on 4/30/20.
//  Copyright © 2020 Chika Ikpechukw. All rights reserved.
//

import UIKit

class AddEditCerealViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCalories: UITextField!
    @IBOutlet weak var txtServing: UITextField!

    var cereal: Cereal?
    enum ActionType {
        case add, edit
    }
    var action: ActionType = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if action == .edit {
            txtName.text = cereal?.name
            txtCalories.text = "\(cereal?.calories ?? 0)"
            txtServing.text = cereal?.serving
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let name = txtName.text?.removeWhiteSpaces(), !name.isEmpty else {
            return
        }
        
        guard !lookForDuplicates() else {
            return
        }
        
        let cereal = Cereal(name, calories: Int(txtCalories.text ?? "") ?? 0, serving: txtServing.text)
        Archiver.saveCereals(cereal)
    }
    
    func lookForDuplicates() -> Bool {
        let cereals = Archiver.getCereals()
        guard let name = txtName.text?.removeWhiteSpaces(), !name.isEmpty else {
            return true
        }
        
        if action == .edit, let c = self.cereal {
            let newCereal = Cereal(name, calories: Int(txtCalories.text ?? "") ?? 0, serving: txtServing.text)
            Archiver.findAndReplace(old: c, replace: newCereal)
            return true
            
        } else {
            let found = cereals.filter { $0.name == name }.first
            // found == true means that there is a record with thie name
            return found != nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
