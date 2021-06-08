//
//  NoteModel.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import Foundation
import RealmSwift

class NoteModel: Object {
  @objc dynamic var title = ""
  @objc dynamic var body = ""
  @objc dynamic var latitude = 0.0
  @objc dynamic var longitude = 0.0
  @objc dynamic var locationAddress = ""
  @objc dynamic var imageURL = ""
  @objc dynamic var createdAt = Date()
  @objc dynamic var distanceFromDevice = 0.0
}


