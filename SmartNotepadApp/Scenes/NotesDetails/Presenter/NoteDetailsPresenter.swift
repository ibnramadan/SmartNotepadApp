//
//  NoteDetailsPresenter.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import Foundation
import RealmSwift

protocol NoteDetailsView: AnyObject {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func saveNoteSuccess()
    func deleteNoteSuccess()
    func editNoteSuccess()
    func showError(error: String)

}



class NoteDetailsPresenter {
      private weak var view: NoteDetailsView?
      private let interactor = NoteDetailsInteractor()

      private var note : NoteModel?
      init(view: NoteDetailsView) {
          self.view = view
      }
      
      func viewDidLoad() {

     
      }
      
    func addNote(noteTitle : String , notebody:String , lat : Double , long : Double , noteAddress : String , noteImageURL : String ){
            
        interactor.addNewNote(noteTitle: noteTitle, notebody: notebody, lat: lat, long: long, noteAddress: noteAddress, noteImageURL: noteImageURL) { done in
            self.view?.saveNoteSuccess()
        } failureHandler: { Error in
            self.view?.showError(error: "Error")
        }

       
       
       
        
    }

    
    func editNote(noteTitle : String , notebody:String , lat : Double , long : Double , noteAddress : String , noteImageURL : String , createdAt : Date ){
      
        interactor.editNote(noteTitle: noteTitle, notebody: notebody, lat: lat, long: long, noteAddress: noteAddress, noteImageURL: noteImageURL, createdAt: createdAt) { done in
            self.view?.editNoteSuccess()
        } failureHandler: { Error in
            self.view?.showError(error: "Error")
        }

           
      
    }
    func deleteNote(note:NoteModel) {
        interactor.deleteNote(note: note) { done in
            self.view?.deleteNoteSuccess()
        } failureHandler: { error in
            self.view?.showError(error: "Error")
        }

    }
   
    
}




