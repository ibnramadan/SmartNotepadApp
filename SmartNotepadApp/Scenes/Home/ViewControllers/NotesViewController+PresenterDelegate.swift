//
//  NotesViewController+PresenterDelegate.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import Foundation

extension NotesViewController : NoteView {
  
    func showIndicator() {
        self.showLoader()
    }
    
    func hideIndicator() {
        self.dismissLoader()
    }
    
    func fetchingDataSuccess() {
        self.NotesTableView.reloadData()
    }
    func EmptyData() {
        NotesTableView.isHidden = true
        backGroundView.isHidden = false
    }
    
    func showError(error: String) {
        
    }
    
    func selectedNoteSuccess(Note: NoteModel) {
        let vc = self.storyboard?.instantiateViewController(identifier: "NoteDetailsViewController") as! NoteDetailsViewController
        vc.note = Note
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   

}

