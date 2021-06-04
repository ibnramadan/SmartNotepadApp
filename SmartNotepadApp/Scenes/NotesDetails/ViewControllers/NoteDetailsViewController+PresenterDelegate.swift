//
//  NoteDetailsViewController+PresenterDelegate.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

mport Foundation

extension NoteDetailsViewController : NoteDetailsView {
    func showIndicator() {
        self.showLoader()
    }
    
    func hideIndicator() {
        self.dismissLoader()
    }
    
    func fetchingDataSuccess() {
        
    }
    
    func saveNoteSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func deleteNoteSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func editNoteSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showError(error: String) {
        
    }
    
    
}

