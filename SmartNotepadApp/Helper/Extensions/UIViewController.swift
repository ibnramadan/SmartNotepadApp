//
//  UIViewController.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit
import KRProgressHUD
extension UIViewController
{
 
  
  func showLoader(){
    KRProgressHUD.show(withMessage: "Loading...", completion: nil)
      
  }
  
  func dismissLoader(){
      KRProgressHUD.dismiss()
      
  }
    
   

}


