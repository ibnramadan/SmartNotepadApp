//
//  NotesPresenter.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import Foundation
import RealmSwift
protocol NoteView: AnyObject {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func EmptyData()
    func showError(error: String)
    func selectedNoteSuccess(Note : NoteModel)

}

protocol NoteCellView {
    func displayNoteTitle(title: String)
    func displayNoteBody(body: String)
    func displayNoteNearestL()
    func displayNoteLocationImage()
    func displayNoteImage()

}


class NotesViewControllerPresenter {
      private weak var view: NoteView?
      private let interactor = NoteInteractor()
//      private var notes = [NoteModel]()
      private var notes : Results<NoteModel>?
      init(view: NoteView) {
          self.view = view
      }
      
      func viewDidLoad() {

        getNotes()
      }
      
    
    func getNotes() {
   
        interactor.getNotes { result in
            self.notes = result
            if self.notes?.count ?? 0 != 0 {
                self.view?.fetchingDataSuccess()
            }else {
                self.view?.EmptyData()
            }
        } failureHandler: { Error in
            self.view?.showError(error: "Error")
        }

        

    }
    
    func getNotesCount() -> Int {
        return notes?.count ?? 0
    }
    
    func configure(cell: NoteCellView, for index: Int) {
        let  note = notes?[index]
        cell.displayNoteTitle(title: note?.title ?? "")
        cell.displayNoteBody(body: note?.body ?? "")
        if index == 0 {
            cell.displayNoteNearestL()
        }
        cell.displayNoteLocationImage()
        cell.displayNoteImage()
    }

    
    func didSelectRow(cell: NoteCellView,for index: Int) {
        if let note = notes?[index] {
        view?.selectedNoteSuccess(Note: note)
        }
    }
  
    
}


