//
//  ViewController.swift
//  Cereals
//
//  Created by Chika Ikpechukwu on 4/30/20.
//  Copyright © 2020 Chika Ikpechukw. All rights reserved.
//

import UIKit

class CerealListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cereals: [Cereal] = [Cereal]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cereals = Archiver.getCereals()
    }
    
    func addCereal() {
        
    }
}

extension CerealListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cereals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CerealCell", for: indexPath)
        cell.textLabel?.text = cereals[indexPath.row].name
        return cell
    }
}

extension CerealListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "EditSerealSegue", sender: cereals[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            Archiver.delete(self.cereals[indexPath.row])
            self.cereals = Archiver.getCereals()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                tableView.reloadData()
            }
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}

extension CerealListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSerealSegue" {
            let destination = segue.destination as! AddEditCerealViewController
            destination.action = .add
        }
        
        if segue.identifier == "EditSerealSegue" {
            let destination = segue.destination as! AddEditCerealViewController
            destination.action = .edit
            destination.cereal = sender as? Cereal
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "EditSerealSegue" {
            return false
        }
        
        return true
    }
}
