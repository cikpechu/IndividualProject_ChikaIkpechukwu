//
//  Extensions.swift
//  Cereal Calories Tracker
//
//  Created by Chika Ikpechukwu on 4/30/20.
//  Copyright © 2020 Chika Ikpechukw. All rights reserved.
//

import UIKit

extension String {
    func removeWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func equalIgnoreCase(_ compare:String) -> Bool {
        return self.uppercased().contains(compare.uppercased())
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .cancel, handler:nil))
        present(alert, animated: true, completion: nil)
    }
}
