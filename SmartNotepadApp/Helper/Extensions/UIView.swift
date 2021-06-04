//
//  UIView.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import Foundation

import UIKit

extension UIView {
    @IBInspectable var isCircled: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.cornerRadius = self.bounds.height / 2
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }

 
}

