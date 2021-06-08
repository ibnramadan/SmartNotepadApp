//
//  Helper.swift
//  SmartNotepadApp
//
//  Created by iMac on 07/06/2021.
//

import Foundation
import UIKit
class Helper {
static func showAlert(style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], completion: (() -> Swift.Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: style)
    
    alert.view.tintColor = .blue
    DispatchQueue.main.async {
        for action in actions {
            alert.addAction(action)
        }
        
        if let topVC = UIApplication.getTopViewController() {
            alert.popoverPresentationController?.sourceView = topVC.view
            alert.popoverPresentationController?.sourceRect = CGRect(x: topVC.view.bounds.midX, y: topVC.view.bounds.midY, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = []
            topVC.present(alert, animated: true, completion: completion)
        }
    }
  }
}
