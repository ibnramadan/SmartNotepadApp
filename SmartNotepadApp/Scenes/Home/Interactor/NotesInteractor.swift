//
//  NotesInteractor.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import Foundation
import RealmSwift
class NoteInteractor{


    func getNotes( callback: @escaping (Results<NoteModel>?) -> Void, failureHandler: @escaping (Error) -> Void){
       let notes = try! Realm().objects(NoteModel.self)
            .sorted(byKeyPath: "createdAt", ascending: false)
        callback(notes)
    }
}

