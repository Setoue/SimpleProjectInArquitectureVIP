//
//  File.swift
//  ProjectVIPArquitecture
//
//  Created by user on 21/03/23.
//

import UIKit


extension UIViewController {
    
    func showError(with message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}

