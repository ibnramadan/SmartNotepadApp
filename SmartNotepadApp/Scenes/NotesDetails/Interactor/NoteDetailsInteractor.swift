//
//  NoteDetailsInteractor.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//


import Foundation
import RealmSwift
class NoteDetailsInteractor{

    private let realm = try! Realm()
    func addNewNote(noteTitle : String , notebody:String , lat : Double , long : Double , noteAddress : String , noteImageURL : String , callback: @escaping (String) -> Void, failureHandler: @escaping (Error) -> Void){
        let newNote = NoteModel()
        try! realm.write {
            newNote.title = noteTitle
            newNote.body = notebody
            newNote.latitude = lat
            newNote.longitude = long
            newNote.locationAddress = noteAddress
            newNote.image = noteImageURL
            newNote.createdAt = Date()
            realm.add(newNote)
            }
        callback("done")
        }
    func editNote(noteTitle : String , notebody:String , lat : Double , long : Double , noteAddress : String , noteImageURL : String , createdAt : Date, callback: @escaping (String) -> Void, failureHandler: @escaping (Error) -> Void){
        let notes = realm.objects(NoteModel.self).filter("createdAt = %@", createdAt)
        if let note = notes.first {
            try! realm.write {
                note.title = noteTitle
                note.body = notebody
                note.latitude = lat
                note.longitude = long
                note.locationAddress = noteAddress
                note.image = noteImageURL
                note.locationAddress = noteAddress
                note.createdAt = Date()
          
            }
    callback("done")
        }
    }
    
    func deleteNote(note : NoteModel? , callback: @escaping (String) -> Void, failureHandler: @escaping (Error) -> Void){
        try! realm.write {
            realm.delete(note ?? NoteModel())
        }
        callback("done")
    }
}


