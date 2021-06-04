//
//  NoteDetailsViewController.swift
//  SmartNotepadApp
//
//  Created by iMac on 04/06/2021.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTView: UITextView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var noteImageBtn: UIButton!
    
    var presenter: NoteDetailsPresenter!
    var note:NoteModel?
    fileprivate var noteLat:Double?
    fileprivate var noteLong:Double?
    fileprivate var noteURL:String?
    fileprivate var noteAddress:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter = NoteDetailsPresenter(view: self)
        configureView()
    }
    

    @IBAction func addLocationBtnPressed(_ sender: Any) {
    }
    

    @IBAction func addPhotoBtnPressed(_ sender: Any) {
    }
    
    @IBAction func saveNoteBtnPressed(_ sender: Any) {
        
        if note == nil {
            presenter.addNote(noteTitle: self.titleTF.text ?? "", notebody: self.bodyTView.text ?? "", lat: noteLat ?? 0.0, long: noteLong ?? 0.0, noteAddress: noteAddress ?? "", noteImageURL: noteURL ?? "")
        }else {
            presenter.editNote(noteTitle: self.titleTF.text ?? "", notebody: self.bodyTView.text ?? "", lat: noteLat ?? 0.0, long: noteLong ?? 0.0, noteAddress: noteAddress ?? "", noteImageURL: noteURL ?? "" , createdAt: self.note?.createdAt ?? Date())
        }
    }
    
    @IBAction func deleteNoteBtnPressed(_ sender: Any) {
        presenter.deleteNote(note: note!)
    
    }
}


extension NoteDetailsViewController {
    
   func configureView() {
        
    if note != nil {
        titleTF.text = note?.title
        bodyTView.text = note?.body
        if let location = note?.locationAddress {
            locationBtn.setTitle(location, for: .normal)
        }
       
    }else {
        bodyTView.delegate = self
        bodyTView.textColor = .lightGray
        self.navigationItem.rightBarButtonItems?[1] = UIBarButtonItem()
        
    }
    }
}
// MARK: - UITextViewDelegate
extension NoteDetailsViewController:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Note Body Here" && textView.textColor == UIColor.lightGray {
            textView.text = nil
        }
        textView.textColor = UIColor.black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Note Body Here"
            textView.textColor = UIColor.lightGray
        }
    }
}
